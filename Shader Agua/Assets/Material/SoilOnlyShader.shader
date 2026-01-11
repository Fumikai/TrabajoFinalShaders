Shader "Custom/URP/SoilGrassSnowFakeShadow"
{
    Properties
    {
        _BaseHeight ("Base Height", Float) = 0
        _BaseBlend ("Base Blend", Range(0.01, 2)) = 0.5

        _SoilColor ("Soil Color", Color) = (0.55, 0.45, 0.35, 1)
        _GrassColor ("Grass Color", Color) = (0.2, 0.5, 0.25, 1)
        _SnowColor ("Snow Color", Color) = (0.9, 0.9, 0.9, 1)
        _SnowShadowColor ("Snow Shadow Color", Color) = (0.7, 0.75, 0.8, 1)

        _GrassHeight ("Grass Min Height", Float) = 0.4
        _GrassBlend ("Grass Blend", Range(0.01, 1)) = 0.3
        _NoiseScale ("Grass Noise Scale", Float) = 3
        _NoiseStrength ("Grass Noise Strength", Range(0,1)) = 0.6

        _SnowHeight ("Snow Min Height", Float) = 1.2
        _SnowBlend ("Snow Blend", Range(0.01, 1)) = 0.4
        _SnowSlopeLimit ("Snow Slope Limit", Range(0,1)) = 0.6

        _Smoothness ("Smoothness", Range(0,1)) = 0.35
    }

    SubShader
    {
        Tags
        {
            "RenderPipeline"="UniversalRenderPipeline"
            "RenderType"="Opaque"
            "Queue"="Geometry"
        }

        Pass
        {
            Name "ForwardLit"
            Tags { "LightMode"="UniversalForward" }

            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"

            struct Attributes
            {
                float4 positionOS : POSITION;
                float3 normalOS   : NORMAL;
            };

            struct Varyings
            {
                float4 positionHCS : SV_POSITION;
                float3 worldPos    : TEXCOORD0;
                float3 worldNormal : TEXCOORD1;
            };

            CBUFFER_START(UnityPerMaterial)
                float _BaseHeight;
                float _BaseBlend;

                float4 _SoilColor;
                float4 _GrassColor;
                float4 _SnowColor;
                float4 _SnowShadowColor;

                float _GrassHeight;
                float _GrassBlend;
                float _NoiseScale;
                float _NoiseStrength;

                float _SnowHeight;
                float _SnowBlend;
                float _SnowSlopeLimit;

                float _Smoothness;
            CBUFFER_END

            // ---------- NOISE ----------
            float hash(float2 p)
            {
                return frac(sin(dot(p, float2(127.1, 311.7))) * 43758.5453);
            }

            float noise(float2 p)
            {
                float2 i = floor(p);
                float2 f = frac(p);

                float a = hash(i);
                float b = hash(i + float2(1, 0));
                float c = hash(i + float2(0, 1));
                float d = hash(i + float2(1, 1));

                float2 u = f * f * (3.0 - 2.0 * f);

                return lerp(a, b, u.x) +
                       (c - a) * u.y * (1.0 - u.x) +
                       (d - b) * u.x * u.y;
            }

            Varyings vert (Attributes v)
            {
                Varyings o;
                o.worldPos = TransformObjectToWorld(v.positionOS.xyz);
                o.worldNormal = normalize(mul(v.normalOS, (float3x3)unity_ObjectToWorld));
                o.positionHCS = TransformWorldToHClip(o.worldPos);
                return o;
            }

            half4 frag (Varyings IN) : SV_Target
            {
                float3 normalWS = normalize(IN.worldNormal);
                float slope = saturate(dot(normalWS, float3(0,1,0)));

                // ----- BASE -----
                float baseMask = smoothstep(0, _BaseBlend, IN.worldPos.y - _BaseHeight);
                float3 color = _SoilColor.rgb;

                // ----- GRASS -----
                float grassHeightMask = smoothstep(
                    _GrassHeight - _GrassBlend,
                    _GrassHeight + _GrassBlend,
                    IN.worldPos.y
                );

                float n = noise(IN.worldPos.xz * _NoiseScale);
                float grassNoise = smoothstep(
                    0.5 - _NoiseStrength,
                    0.5 + _NoiseStrength,
                    n
                );

                float grassMask = grassHeightMask * grassNoise * slope;
                color = lerp(color, _GrassColor.rgb, grassMask);

                // ----- SNOW -----
                float snowHeightMask = smoothstep(
                    _SnowHeight - _SnowBlend,
                    _SnowHeight + _SnowBlend,
                    IN.worldPos.y
                );

                float snowSlopeMask = saturate(
                    (slope - _SnowSlopeLimit) / (1 - _SnowSlopeLimit)
                );

                float snowMask = snowHeightMask * snowSlopeMask;

                float snowShade = pow(slope, 2);
                float3 snowColorShaded = lerp(
                    _SnowShadowColor.rgb,
                    _SnowColor.rgb,
                    snowShade
                );

                color = lerp(color, snowColorShaded, snowMask);
                color *= baseMask;

                // ----- INPUT DATA -----
                InputData inputData = (InputData)0;
                inputData.positionWS = IN.worldPos;
                inputData.normalWS = normalWS;
                inputData.viewDirectionWS = normalize(GetWorldSpaceViewDir(IN.worldPos));
                inputData.shadowCoord = TransformWorldToShadowCoord(IN.worldPos);
                inputData.bakedGI = SampleSH(normalWS);
                inputData.shadowMask = 1;

                // ----- SURFACE DATA (CLAVE) -----
                SurfaceData surfaceData = (SurfaceData)0;
                surfaceData.albedo = color;
                surfaceData.metallic = 0;
                surfaceData.specular = float3(0.04, 0.04, 0.04);
                surfaceData.smoothness = lerp(_Smoothness, 0.6, snowMask);
                surfaceData.normalTS = float3(0,0,1);
                surfaceData.occlusion = 1;
                surfaceData.emission = 0;
                surfaceData.alpha = 1;
                surfaceData.clearCoatMask = 0;
                surfaceData.clearCoatSmoothness = 0;

                return UniversalFragmentPBR(inputData, surfaceData);
            }
            ENDHLSL
        }
    }
}
