Shader "Unlit/Shader01"
{
  Properties{ //Input data
      //_MainTex ("Texture", 2D) = "white" {} //Si tienes una propiedad, más abajo tienes que definirla como variable.
      _Color("Color", Color ) = (1,1,1,1) //Dentro tenemos el nombre del inspector y con _ el nombre interno.
  }
    SubShader{ //Subshader y Pass tienen tags para explicar cómo se tiene que renderizar este objeto. Subshader es más render pipeline stuff, el Pass es más relacionado con gráficos. 
        Tags { "RenderType" = "Opaque" } //Es opaco, transparente, se renderiza antes/después de otro shader...

        Pass{ //Cosas más explícitas de rendering que se pasa a sí mismo el shader, como blending mode, stencil properties... 
            CGPROGRAM //Es prácticamente HLSL. Aquí empieza el código de shader.
            #pragma vertex vert //Le dicen al compilador qué funcion es el vertex shader y el fragment shader. En este caso serán vert y frag.
            #pragma fragment frag

            #include "UnityCG.cginc" //Incluye código específico de Unity para hacer las cosas más eficientes, prácticas etc. 

            float4 _Color; //Podemos acceder a las properties desde el vertex y el fragment shader

            //Esto lo rellena automáticamente UNITY
            struct MeshData{ //Per-vertex mesh data //anteriormente llamada appdata, pero no le gusta a freya el nombre.
                float4 vertex : POSITION; //Vertex position //El ":" es un semantic para pasar la información POSITION a la variable vertex
                float2 uv : TEXCOORD0; //UV Coordinates //Esto suele ser la textura diffuse/normal  //Puedes hacer los UV un float4.
            };

            struct v2f{ //La información que se pasa del vertex shader al fragment shader. Freya lo llama INterpolators, porque la información del pixel se interpola a partir de la información de los vértices. Esto con 3V se llama "interpolación baricéntrica", pero básicamente es un lerp a 3 bandas.
                float4 vertex : SV_POSITION; //Clip space position de cada vertex
                float3 color : TEXTCOORD0;
            };

            v2f vert (MeshData v){
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex); //Convierte local space a Clip space multiplicando por la MVP Matrix (Model View Projection)
                o.color = _Color.rgb;
                return o;
            }


            float4 frag(v2f i) : SV_Target{ //El semantic nos dice que esta función hace output al fragment buffer

                return float4(i.color,1); //Volvemos a asignar color, pero esta vez lo pasamos desde los vértices al fragment
            }
            ENDCG
        }
    }
}
