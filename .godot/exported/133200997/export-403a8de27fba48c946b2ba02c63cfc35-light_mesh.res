RSRC                    VisualShader            ��������                                            8      resource_local_to_scene    resource_name    output_port_for_preview    default_input_values    expanded_output_ports 	   constant    script    op_type    code    graph_offset    mode    modes/blend    modes/depth_draw    modes/cull    modes/diffuse    modes/specular    flags/depth_prepass_alpha    flags/depth_test_disabled    flags/sss_mode_skin    flags/unshaded    flags/wireframe    flags/skip_vertex_transform    flags/world_vertex_coords    flags/ensure_correct_normals    flags/shadows_disabled    flags/ambient_light_disabled    flags/shadow_to_opacity    flags/vertex_lighting    flags/particle_trails    flags/alpha_to_coverage     flags/alpha_to_coverage_and_one    flags/debug_shadow_splits    nodes/vertex/0/position    nodes/vertex/connections    nodes/fragment/0/position    nodes/fragment/2/node    nodes/fragment/2/position    nodes/fragment/3/node    nodes/fragment/3/position    nodes/fragment/connections    nodes/light/0/position    nodes/light/connections    nodes/start/0/position    nodes/start/connections    nodes/process/0/position    nodes/process/connections    nodes/collide/0/position    nodes/collide/connections    nodes/start_custom/0/position    nodes/start_custom/connections     nodes/process_custom/0/position !   nodes/process_custom/connections    nodes/sky/0/position    nodes/sky/connections    nodes/fog/0/position    nodes/fog/connections        ,   local://VisualShaderNodeColorConstant_gdq03 �      *   local://VisualShaderNodeMultiplyAdd_74c6h �         local://VisualShader_jewnj c         VisualShaderNodeColorConstant             VisualShaderNodeMultiplyAdd                              
                 
   ff@��?      
                             VisualShader          �  shader_type spatial;
render_mode blend_mix, depth_draw_opaque, cull_back, diffuse_lambert, specular_schlick_ggx;




void fragment() {
// ColorConstant:2
	vec4 n_out2p0 = vec4(1.000000, 1.000000, 1.000000, 1.000000);


// MultiplyAdd:3
	vec2 n_in3p1 = vec2(2.22500, 1.66500);
	vec2 n_in3p2 = vec2(0.00000, 0.00000);
	vec2 n_out3p0 = fma(vec2(n_out2p0.xy), n_in3p1, n_in3p2);


// Output:0
	EMISSION = vec3(n_out3p0, 0.0);


}
 "   
     �C  C#             $   
   � ��\�WC%            &   
     4C  HC'                                            RSRC