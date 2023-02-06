Shader "Unlit/Shader01"
{
	Properties{ //Input data
		//_MainTex ("Texture", 2D) = "white" {} //Si tienes una propiedad, más abajo tienes que definirla como variable.
		_ColorA("Color A", Color) = (1,0,0,1)
		_ColorB("Color B", Color) = (0,0,1,1)
		_ColorStart("Color Start", Range(0,1)) = 0 //Podemos utilizar Range para decirle al inspector un rango de valores válido
		_ColorEnd("Color End", Range(0,1)) = 1
	}
		SubShader{ //Subshader y Pass tienen tags para explicar cómo se tiene que renderizar este objeto. Subshader es más render pipeline stuff, el Pass es más relacionado con gráficos. 
			Tags { "RenderType" = "Opaque" } //Es opaco, transparente, se renderiza antes/después de otro shader...

			Blend One One

			Pass{ //Cosas más explícitas de rendering que se pasa a sí mismo el shader, como blending mode, stencil properties... 
				CGPROGRAM //Es prácticamente HLSL. Aquí empieza el código de shader.
				#pragma vertex vert //Le dicen al compilador qué funcion es el vertex shader y el fragment shader. En este caso serán vert y frag.
				#pragma fragment frag

				#include "UnityCG.cginc" //Incluye código específico de Unity para hacer las cosas más eficientes, prácticas etc. 

				#define TAU 6.28318530718

				float4 _ColorA;
				float4 _ColorB;
				float _ColorStart;
				float _ColorEnd;

				//Esto lo rellena automáticamente UNITY
				struct MeshData { //Per-vertex mesh data //anteriormente llamada appdata, pero no le gusta a freya el nombre.
					float4 vertex : POSITION; //Vertex position //El ":" es un semantic para pasar la información POSITION a la variable vertex
					float3 normals : NORMAL;
					float2 uv : TEXCOORD0; //¡¡IMPORTNATE!! En Mesh Data, TEXCOORD0 = UV pero en v2f TEXCOORD0 es solo un índice. UV Coordinates //Esto suele ser la textura diffuse/normal  //Puedes hacer los UV un float4.
				};

				struct v2f { //La información que se pasa del vertex shader al fragment shader. Freya lo llama INterpolators, porque la información del pixel se interpola a partir de la información de los vértices. Esto con 3V se llama "interpolación baricéntrica", pero básicamente es un lerp a 3 bandas.
					float4 vertex : SV_POSITION; //Clip space position de cada vertex
					float3 normal : TEXTCOORD0;
					float2 uv : TEXCOORD1; //Normalmente las coordenadas UV son 2D. 
				};

				v2f vert(MeshData v) {
					v2f o;
					o.vertex = UnityObjectToClipPos(v.vertex); //Convierte local space a Clip space multiplicando por la MVP Matrix (Model View Projection)
					o.normal = UnityObjectToWorldNormal(v.normals); //convierte de object space a world space
					o.uv = v.uv;
					return o;
				}

				float InverseLerp(float a, float b, float v) {
				  return (v - a) / (b - a);
				}


				float4 frag(v2f i) : SV_Target{ //El semantic nos dice que esta función hace output al fragment buffer

					//_Time //Variable global de shaders, por eso es accesible. Tiene componentes xyzw, siendo que y son segundos y w segundos/10

					float xOffset = cos(i.uv.x * TAU * 8) * 0.01f;
					float t = cos((i.uv.y - xOffset - _Time.y * 0.1f) * TAU * 5) * 0.5 + 0.5;  //Crea las franjas que se repiten
					t *= (1 - i.uv.y);

					return t;
				}
				ENDCG
			}
	}
}
