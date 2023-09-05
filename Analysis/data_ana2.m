clc 
clear
set(0,'defaultfigurecolor','w')

orig_bagdata = rosbag('./AMR/original2.bag');
hybridastar_bagdata = rosbag('./AMR/hybrid_astar_global_planner2.bag');
teb_loc_bagdata = rosbag('./AMR/teb_local_planner2.bag');
teb_loc_hybrid_bagdata = rosbag('./AMR/teb_local_and_hybrid_astar2.bag');

orig_bagtopic1 = select(orig_bagdata,'Topic','/me5413_world/absolute/heading_error');
orig_bagtopic2 = select(orig_bagdata,'Topic','/me5413_world/absolute/position_error');
orig_bagtopic3 = select(orig_bagdata,'Topic','/me5413_world/relative/heading_error');
orig_bagtopic4 = select(orig_bagdata,'Topic','/me5413_world/relative/position_error');
orig_bagdata1 = readMessages(orig_bagtopic1);
orig_bagdata2 = readMessages(orig_bagtopic2);
orig_bagdata3 = readMessages(orig_bagtopic3);
orig_bagdata4 = readMessages(orig_bagtopic4);

hybridastar_bagtopic1 = select(hybridastar_bagdata,'Topic','/me5413_world/absolute/heading_error');
hybridastar_bagtopic2 = select(hybridastar_bagdata,'Topic','/me5413_world/absolute/position_error');
hybridastar_bagtopic3 = select(hybridastar_bagdata,'Topic','/me5413_world/relative/heading_error');
hybridastar_bagtopic4 = select(hybridastar_bagdata,'Topic','/me5413_world/relative/position_error');
hybridastar_bagdata1 = readMessages(hybridastar_bagtopic1);
hybridastar_bagdata2 = readMessages(hybridastar_bagtopic2);
hybridastar_bagdata3 = readMessages(hybridastar_bagtopic3);
hybridastar_bagdata4 = readMessages(hybridastar_bagtopic4);

teb_loc_bagtopic1 = select(teb_loc_bagdata,'Topic','/me5413_world/absolute/heading_error');
teb_loc_bagtopic2 = select(teb_loc_bagdata,'Topic','/me5413_world/absolute/position_error');
teb_loc_bagtopic3 = select(teb_loc_bagdata,'Topic','/me5413_world/relative/heading_error');
teb_loc_bagtopic4 = select(teb_loc_bagdata,'Topic','/me5413_world/relative/position_error');
teb_loc_bagdata1 = readMessages(teb_loc_bagtopic1);
teb_loc_bagdata2 = readMessages(teb_loc_bagtopic2);
teb_loc_bagdata3 = readMessages(teb_loc_bagtopic3);
teb_loc_bagdata4 = readMessages(teb_loc_bagtopic4);

teb_loc_hybrid_bagtopic1 = select(teb_loc_hybrid_bagdata,'Topic','/me5413_world/absolute/heading_error');
teb_loc_hybrid_bagtopic2 = select(teb_loc_hybrid_bagdata,'Topic','/me5413_world/absolute/position_error');
teb_loc_hybrid_bagtopic3 = select(teb_loc_hybrid_bagdata,'Topic','/me5413_world/relative/heading_error');
teb_loc_hybrid_bagtopic4 = select(teb_loc_hybrid_bagdata,'Topic','/me5413_world/relative/position_error');
teb_loc_hybrid_bagdata1 = readMessages(teb_loc_hybrid_bagtopic1);
teb_loc_hybrid_bagdata2 = readMessages(teb_loc_hybrid_bagtopic2);
teb_loc_hybrid_bagdata3 = readMessages(teb_loc_hybrid_bagtopic3);
teb_loc_hybrid_bagdata4 = readMessages(teb_loc_hybrid_bagtopic4);


%% absolute heading ereeor
orig_abs_pos_err = zeros(1,1019);
hybridastar_abs_pos_err = zeros(1,1248);
teb_loc_abs_pos_err = zeros(1,805);
teb_loc_hybrid_abs_pos_err = zeros(1,754);
for i = 13:1031
    orig_abs_pos_err(i-12) = orig_bagdata1{i,1}.Data;
end

for i = 92:1339
    hybridastar_abs_pos_err(i-91) = hybridastar_bagdata1{i,1}.Data;
end

for i = 56:860
    teb_loc_abs_pos_err(i-55) = teb_loc_bagdata1{i,1}.Data;
end

for i = 47:800
    teb_loc_hybrid_abs_pos_err(i-46) = teb_loc_hybrid_bagdata1{i,1}.Data;
end

figure(1)
plot(orig_abs_pos_err)
hold on
plot(hybridastar_abs_pos_err)
hold on
plot(teb_loc_abs_pos_err)
hold on
plot(teb_loc_hybrid_abs_pos_err)
legend('absolute heading error','absolute heading error(hybrid astar)','absolute heading error(teb local plan)','absolute heading error(teb loca plan and hybridastar)')
title('absolute heading error')

%% absolute position error
orig_abs_pos_err = zeros(1,1019);
hybridastar_abs_pos_err = zeros(1,1248);
teb_loc_abs_pos_err = zeros(1,805);
teb_loc_hybrid_abs_pos_err = zeros(1,754);
for i = 13:1031
    orig_abs_pos_err(i-12) = orig_bagdata2{i,1}.Data;
end

for i = 92:1339
    hybridastar_abs_pos_err(i-91) = hybridastar_bagdata2{i,1}.Data;
end

for i = 56:860
    teb_loc_abs_pos_err(i-55) = teb_loc_bagdata2{i,1}.Data;
end

for i = 47:800
    teb_loc_hybrid_abs_pos_err(i-46) = teb_loc_hybrid_bagdata2{i,1}.Data;
end

figure(2)
plot(orig_abs_pos_err)
hold on
plot(hybridastar_abs_pos_err)
hold on
plot(teb_loc_abs_pos_err)
hold on
plot(teb_loc_hybrid_abs_pos_err)
legend('absolute position error','absolute position error(hybrid astar)','absolute position error(teb local plan)','absolute position error(teb loca plan and hybridastar)')
title('absolute position error')

%% relative heading error
orig_rel_hea_err = zeros(1,1019);
hybridastar_rel_hea_err = zeros(1,1248);
teb_loc_rel_hea_err = zeros(1,805);
teb_loc_hybrid_rel_hea_err = zeros(1,754);
for i = 13:1031
    orig_rel_hea_err(i-12) = orig_bagdata1{i,1}.Data;
end

for i = 92:1339
    hybridastar_rel_hea_err(i-91) = hybridastar_bagdata3{i,1}.Data;
end

for i = 56:860
    teb_loc_rel_hea_err(i-55) = teb_loc_bagdata3{i,1}.Data;
end

for i = 47:800
    teb_loc_hybrid_rel_hea_err(i-46) = teb_loc_hybrid_bagdata3{i,1}.Data;
end

figure(3)
plot(orig_rel_hea_err)
hold on
plot(hybridastar_rel_hea_err)
hold on
plot(teb_loc_rel_hea_err)
hold on
plot(teb_loc_hybrid_rel_hea_err)
legend('relative heading error','relative heading error(hybrid astar)','relative heading error(teb local plan)','relative heading error(teb loca plan and hybridastar)')
title('relative heading error')

%% relative position error
orig_rel_pos_err = zeros(1,1019);
hybridastar_rel_pos_err = zeros(1,1248);
teb_loc_rel_pos_err = zeros(1,805);
teb_loc_hybrid_rel_pos_err = zeros(1,754);
for i = 13:1031
    orig_rel_pos_err(i-12) = orig_bagdata4{i,1}.Data;
end

for i = 92:1339
    hybridastar_rel_pos_err(i-91) = hybridastar_bagdata4{i,1}.Data;
end

for i = 56:860
    teb_loc_rel_pos_err(i-55) = teb_loc_bagdata4{i,1}.Data;
end

for i = 47:800
    teb_loc_hybrid_rel_pos_err(i-46) = teb_loc_hybrid_bagdata4{i,1}.Data;
end

figure(4)
plot(orig_rel_pos_err)
hold on
plot(hybridastar_rel_pos_err)
hold on
plot(teb_loc_rel_pos_err)
hold on
plot(teb_loc_hybrid_rel_pos_err)
legend('relative position error','relative position error(hybrid astar)','relative position error(teb local plan)','relative position error(teb loca plan and hybridastar)')
title('relative position error')