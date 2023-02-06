Shader "Unlit/vertexOffset"
{
	Properties{ //Input data
		_ColorA("Color A", Color) = (1,0,0,1)
		_ColorB("Color B", Color) = (0,0,1,1)
		_ColorStart("Color Start", Range(0,1)) = 0 //Podemos utilizar Range para decirle al inspector un rango de valores válido
		_ColorEnd("Color End", Range(0,1)) = 1
		_WaveAmplitude("Wave Amplitude", Range(0,0.2)) = 0.1
	}
		SubShader{
			Tags {
			"RenderType" = "Opaque" 
			"RenderQueue" = "Geometry" //L'equivalent a Opaque
			}

			Pass{
				CGPROGRAM
				#pragma vertex vert 
				#pragma fragment frag

				#include "UnityCG.cginc"  

				#define TAU 6.28318530718

				float4 _ColorA;
				float4 _ColorB;
				float _ColorStart;
				float _ColorEnd;
				float _WaveAmplitude;

				struct MeshData {
					float4 vertex : POSITION;
					float3 normals : NORMAL;
					float2 uv : TEXCOORD0;
				};

				struct v2f {
					float4 vertex : SV_POSITION;
					float3 normal : TEXTCOORD0;
					float2 uv : TEXCOORD1;
				};

				v2f vert(MeshData v) {
					v2f o;

					float wave = cos((v.uv.x - _Time.y * 0.1f) * TAU * 8);
					v.vertex.y = wave * _WaveAmplitude;
					//Podriem tenir una ona doble 
					//float wave2 = cos((v.uv.y - _Time.y * 0.1f) * TAU * 8);
					//v.vertex.y = wave * _WaveAmplitude * wave2;

					o.vertex = UnityObjectToClipPos(v.vertex);
					o.normal = UnityObjectToWorldNormal(v.normals);
					o.uv = v.uv;
					return o;
				}

				float InverseLerp(float a, float b, float v) {
				  return (v - a) / (b - a);
				}


				float4 frag(v2f i) : SV_Target{

					float t = cos((i.uv.x - _Time.y * 0.1f) * TAU * 8) * 0.5 + 0.5;

					return t;
				}
				ENDCG
			}
	}
}
