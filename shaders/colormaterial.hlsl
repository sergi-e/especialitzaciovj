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

            //sampler2D _MainTex; //Aquí la propiedad definida como variable
            //float4 _MainTex_ST;

            float4 _Color; //Podemos acceder a las properties desde el vertex y el fragment shader

            //Esto lo rellena automáticamente UNITY
            struct MeshData{ //Per-vertex mesh data //anteriormente llamada appdata, pero no le gusta a freya el nombre.
                float4 vertex : POSITION; //Vertex position //El ":" es un semantic para pasar la información POSITION a la variable vertex
                //float3 normals: NORMAL; //La normal del vértice
                //float4 color: COLOR; //Float4 porque siempre es RGBA
                //float4 tangent : TANGENT; //Es float4 porque las tres coordenadas de la tangente y la cuarta coordenada es información de signo. 
                float2 uv : TEXCOORD0; //UV Coordinates //Esto suele ser la textura diffuse/normal  //Puedes hacer los UV un float4.
                //float2 uv2 : TEXCOORD2; //uv2 coordinates //Y luego ya podemos poner por ejemplo el lightmap. 
            };

            struct v2f{ //La información que se pasa del vertex shader al fragment shader. Freya lo llama INterpolators, porque la información del pixel se interpola a partir de la información de los vértices. Esto con 3V se llama "interpolación baricéntrica", pero básicamente es un lerp a 3 bandas.
                float4 vertex : SV_POSITION; //Clip space position de cada vertex
                float2 uv : TEXCOORD0; //Esto se llama uv, pero no tiene por qué tener nada que ver con uv, mientras uqe en MeshData sí. 
                //float2 uv: TEXTCOORD1; // Puedes meterle tantas texturas como quieras, al final solo estás pasando info. 
            };

            v2f vert (MeshData v){
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex); //Convierte local space a Clip space multiplicando por la MVP Matrix (Model View Projection)
                //Si dejáramos solo o.vertex = v.vertex; se quedaría la imagen pegada en cámara. Esto puede ser útil si estamos añadiendo algo de postproceso al clip
                //o.uv = TRANSFORM_TEX(v.uv, _MainTex); //ignoramos la textura por ahora 
                return o;
            }

            //En UNITY float4 = Vector4; (32 bit float). Útil para world space. Puedes utilizarlo siempre para todo y ya.
            //En shaders tenemos half (16 bit float) Este suele ser útil par ala mayoría de las cosas
            //Y fixed (lowe precision, aprox 12 bits). Solo se usa en rango -1 a 1 porque da muy mala precisión fuera.
            //Podríamos hacer matrices float4x4 o half4x4
            //Bool existe, pero es equivalente a 0 y 1.
            //Tenemos int, pero muchas veces se van a convertir a floats automáticamente. 
            //De normal utilizaremos float para todo hasta uqe tengamos que optimizar. Entonces podemos pasar a preocuparnos por utilizar cosas de baja precisión.
            /*float4 myvalue; --> Esto es lo que llamamos swizzling
            float2 otherv = myvalue.xy;
            float2 turnv = myvalue.yx;
            float2 colorv = myvalue.rg;*/

            float4 frag(v2f i) : SV_Target{ //El semantic nos dice que esta función hace output al fragment buffer

                return _Color; //Devuelve rojo
            }
            ENDCG
        }
    }
}
