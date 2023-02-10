Shader "Unlit/texture"{
    Properties{
        _MainTex ("Texture", 2D) = "white" {} //Hi ha textures 3D i cube maps que treballen de diferent manera
		_Pattern("Pattern", 2D) = "green" {} //Aquest "green" indica què vols que s'assigne si no hi ha res assignat. Són 
		_SecTex("SecTex", 2D) = "pink" {}
	}
    SubShader{
        Tags { "RenderType"="Opaque" }

        Pass{
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

			#define	TAU 6.28

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
			sampler2D _Pattern; //No anema a afegir tiling/offset per aquest. No cal un _Pasttern_ST
			sampler2D _SecTex;

            v2f vert (appdata v){
                v2f o;
				o.worldPos = mul(UNITY_MATRIX_M, v.vertex); //transforma la posició del vèrtex de local space a world space. 
                o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = v.uv;  
                return o;
            }

			fixed4 frag(v2f i) : SV_Target{

				float2 topDownProjection = i.worldPos.xz; //Agafem les coordenades XZ que són segons la posició en el plànol de terra. 

				float4 grass = tex2D(_MainTex, topDownProjection); //Mapeamos la textura según la worldpos. Esto se hace mucho en terreno.
				float4 pattern = tex2D(_Pattern, i.uv);
				//Para hacer que el pattern aparezca y desaparezca según cos del tiempo
				//float4 pattern = tex2D(_Pattern, i.uv) * abs(cos(_Time.y));
				float4 rock = tex2D(_SecTex, topDownProjection);
				float4 finalColor = lerp(rock, grass, pattern); //Lerp entre un rojo y una textura

				return finalColor; //La textura está mapeada en worldpos y la textura no, de modo que si rotamos o escalamos el plano, tan solo cambia el mapa del patrón
            }
            ENDCG
        }
    }
}
