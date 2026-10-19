varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    // Coordenadas da tela: centro = (0, 0)
    vec2 uv = v_vTexcoord;
    vec2 p = uv * 2.0 - 1.0;

    // =====================================
    // 1. CURVATURA DO VIDRO CRT
    // =====================================

    float curvature = 0.035;

    p *= 1.0 + curvature * dot(p, p);

    uv = p * 0.5 + 0.5;

    // =====================================
    // 2. FORA DA TELA: PRETO
    // =====================================

    if (
        uv.x < 0.0 ||
        uv.x > 1.0 ||
        uv.y < 0.0 ||
        uv.y > 1.0
    )
    {
        gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);
        return;
    }

    // =====================================
    // 3. AMOSTRAR A IMAGEM
    // =====================================

    vec4 col = texture2D(gm_BaseTexture, uv)
             * v_vColour;

    // =====================================
    // 4. LINHAS DE VARREDURA
    // =====================================

    float scanline = 0.94
        + 0.06 * sin(uv.y * 900.0);

    col.rgb *= scanline;

    // =====================================
    // 5. ESCURECIMENTO DAS BORDAS
    // =====================================

    float vignette = 1.0
        - 0.20 * dot(p, p);

    col.rgb *= clamp(vignette, 0.65, 1.0);

    // =====================================
    // 6. RESULTADO
    // =====================================

    gl_FragColor = col;
}