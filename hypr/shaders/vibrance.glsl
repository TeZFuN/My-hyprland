#version 320 es
precision mediump float;

uniform sampler2D tex;
in vec2 v_texcoord;
out vec4 fragColor;

const float VIB_VIBRANCE = 1.6; 
const vec3 VIB_CoefLuma = vec3(0.212656, 0.715158, 0.072186);

void main() {
    vec4 color = texture(tex, v_texcoord);
    vec3 inputColor = color.rgb;

    float luma = dot(VIB_CoefLuma, inputColor);
    
    // Поэтапный поиск максимума и минимума без перегрузки типов
    float maxColor = max(inputColor.r, max(inputColor.g, inputColor.b));
    float minColor = min(inputColor.r, min(inputColor.g, inputColor.b));
    
    float colorSaturation = maxColor - minColor;

    vec3 finalColor = mix(vec3(luma), inputColor, 1.0 + (VIB_VIBRANCE * (1.0 - (sign(VIB_VIBRANCE) * colorSaturation))));
    
    fragColor = vec4(finalColor, color.a);
}
