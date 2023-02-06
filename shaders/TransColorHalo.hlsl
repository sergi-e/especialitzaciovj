/* Quan els shaders volen renderitzar comproven el depth buffer per decidir si l'element es veu o no, i si no es veu, no es renderitza.
Açò fa que tenir molts objectes transparents superposats resulte molt car, perquè has de renderitzar-los tots. 
Si un objecte és transparent, cal dir-li que no ha d'escriure en el depth buffer.
Podem desactivar tant que un objecte escriga en el Depth Buffer, de manera que no taparà cap objecte al darrere, com que lligi del
Buffer, de manera que cap objecte podrà tapar-lo. 
*/

/* Hay un orden en que las cosas se renderizan: Skybox > Opaque o Geometry > Transparent (también aditivos) > Overlays (lens flares etc) 
Para las cosas transparentes debemos cambiar el modo de render y la cola de render*/

/*També cal tenir en compte que, si és transparent i es poden veure totes les cares de l'objecte, cal canviar el backface culling
Cull Back --> Valor per defecte, activa el backface culling
Cull Front --> No renderitza les cares frontals
Cull Off --> Desactiva el culling*/

Shader "Unlit/Shader01"
{
	Properties{ //Input data
		_ColorA("Color A", Color) = (1,0,0,1)
		_ColorB("Color B", Color) = (0,0,1,1)
		_ColorStart("Color Start", Range(0,1)) = 0 //Podemos utilizar Range para decirle al inspector un rango de valores válido
		_ColorEnd("Color End", Range(0,1)) = 1
	}
		SubShader{ 
			Tags {
			"RenderType" = "Transparent" //Açò és més un tag per a coses de postprocessat al render pipeline
			"RenderQueue" = "Transparent" //Aquest és que canvia l'ordre de renderitzat
			} 

			ZWrite Off //Le decimos que no escriba en el Depth Buffer
			ZTest Off //El default value es LEqual--> Si depth less or equal a la que figura al depth, mostra. Hi ha altres

			Cull Off //Desactiva el culling

			Blend One One

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
					o.vertex = UnityObjectToClipPos(v.vertex); 
					o.normal = UnityObjectToWorldNormal(v.normals); 
					o.uv = v.uv;
					return o;
				}

				float InverseLerp(float a, float b, float v) {
				  return (v - a) / (b - a);
				}


				float4 frag(v2f i) : SV_Target{ 

					float xOffset = cos(i.uv.x * TAU * 8) * 0.01f;
					float t = cos((i.uv.y - xOffset - _Time.y * 0.1f) * TAU * 8) * 0.5 + 0.5;  
					t *= (1 - i.uv.y);

					float topBottomRemover = (abs(i.normal.y) < 0.999); // Per desfer-nos de les cares sup-inf del cilindre en posició natural
					float waves = t * topBottomRemover; 

					float4 gradient = lerp(_ColorA, _ColorB, i.uv.y);

					return gradient * waves;
				}
				ENDCG
			}
	}
}
