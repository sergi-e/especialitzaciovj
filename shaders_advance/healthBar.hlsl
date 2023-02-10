Shader "Unlit/healthBar"
{
    Properties
    {
        [NoScaleOffset] _MainTex ("Texture", 2D) = "white" {} //Llevem de l'inspector les opcions de scale i offset per a la textura
		_Health("Health", Range(0,1)) = 1
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
			float _Health;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv, _MainTex;
                return o;
            }

			fixed4 frag(v2f i) : SV_Target
			{
				float healthBarMask = _Health > i.uv.x;
				
				float3 healthBarColor = (1 - _Health, _Health, 0); 

				return float4(healthBarColor.xyz,1);
            }
            ENDCG
        }
    }
}
