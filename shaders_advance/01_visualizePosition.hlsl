
Shader "Unlit/texture"{
    Properties{
        _MainTex ("Texture", 2D) = "white" {} //Hi ha textures 3D i cube maps que treballen de diferent manera
    }
    SubShader{
        Tags { "RenderType"="Opaque" }

        Pass{
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata{
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f{
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
				float3 worldPos : TEXCOORD01;
            };

            sampler2D _MainTex; //La textura per al sampling
            float4 _MainTex_ST; //Opcional, emmagatzema l'escala

            v2f vert (appdata v){
                v2f o;
				o.worldPos = mul(UNITY_MATRIX_M, float4(v.vertex.xyz,1)); //transforma la posició del vèrtex de local space a world space. 
                o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = TRANSFORM_TEX(v.uv, _MainTex); //Aquesta funció pren l'offset i l'aplica al UV 
				o.uv.x += _Time.y * 0.1; //Fa que la textura es mogui, pot ser útil per rius etc. 
                return o;
            }

			fixed4 frag(v2f i) : SV_Target{
				return float4(i.worldPos.xyz,1);

				float4 col = tex2D(_MainTex, i.uv);

				return col;
            }
            ENDCG
        }
    }
}
