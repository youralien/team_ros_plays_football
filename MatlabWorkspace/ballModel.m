% ball model for soccer robot project on vrep 
% Romain Chiappinelli A0145192H
% 11.03.16

clc; clear all; close all;

% test made using v2Pos
% model: d(t) = k*(1-exp(-at))
k=0.0345, T=2.15

d=@(t) k.*(1.-exp(-t./T))   % times v: the speed of the robot when shooting
d_dot=@(t) (k./T).*exp(-t./T) % times v

% t5 = [0.0, 0.10800004005432129, 0.22800016403198242, 0.3340001106262207, 0.4509999752044678, 0.5729999542236328, 0.7050001621246338, 0.8350000381469727, 0.945000171661377, 1.0329999923706055, 1.195000171661377, 1.4000000953674316, 1.5369999408721924, 1.61899995803833, 1.7250001430511475, 1.8340001106262207, 1.9500000476837158, 2.055000066757202, 2.17900013923645, 2.2960000038146973, 2.4210000038146973, 2.5399999618530273, 2.6389999389648438, 2.751000165939331, 2.8519999980926514, 2.953000068664551, 3.0369999408721924, 3.1540000438690186, 3.240999937057495, 3.3400001525878906, 3.443000078201294, 3.5470001697540283, 3.638000011444092, 3.740999937057495, 3.8510000705718994, 3.940000057220459, 4.039999961853027, 4.141000032424927, 4.246999979019165, 4.3470001220703125, 4.447999954223633, 4.578000068664551, 4.674000024795532, 4.763000011444092, 4.865000009536743, 4.9709999561309814, 5.064000129699707, 5.163000106811523, 5.275000095367432, 5.365999937057495, 5.488000154495239, 5.578999996185303, 5.676000118255615, 5.7799999713897705, 5.901000022888184, 6.001000165939331, 6.105999946594238, 6.196000099182129, 6.289999961853027, 6.384000062942505, 6.489000082015991, 6.617000102996826, 6.700000047683716, 6.808000087738037, 6.900000095367432, 6.998000144958496, 7.101000070571899, 7.197999954223633, 7.305000066757202, 7.39900016784668, 7.495000123977661, 7.5929999351501465, 7.692000150680542, 7.812999963760376, 7.914999961853027, 8.003000020980835, 8.115999937057495, 8.212000131607056, 8.342999935150146, 8.434000015258789, 8.516000032424927, 8.63100004196167, 8.743000030517578, 8.828999996185303, 8.945000171661377, 9.032000064849854, 9.141000032424927, 9.240000009536743, 9.332000017166138, 9.450999975204468, 9.539999961853027, 9.656000137329102, 9.751000165939331, 9.848999977111816, 9.939000129699707];
% d5 = [0.0, 1.4901161193847656e-08, 2.9802322387695312e-08, 2.9802322387695312e-08, 0.0, 0.0, 0.0, 0.0, 1.4901161193847656e-08, 1.4901161193847656e-08, 1.4901161193847656e-08, 1.4901161193847656e-08, 1.4901161193847656e-08, 1.4901161193847656e-08, 1.4901161193847656e-08, 1.4901161193847656e-08, 1.4901161193847656e-08, 1.4901161193847656e-08, 1.4901161193847656e-08, 1.4901161193847656e-08, 0.0, 0.0, 0.0, 0.0, 2.9802322387695312e-08, 2.9802322387695312e-08, 2.9802322387695312e-08, 0.0, 0.0, 0.0, 0.0, 2.9802322387695312e-08, 2.9802322387695312e-08, 0.0, 0.0, 0.0, 0.0, 0.0, 2.9802322387695312e-08, 2.9802322387695312e-08, 0.0, 0.0, 0.0, 0.0, 2.9802322387695312e-08, 2.9802322387695312e-08, 2.9802322387695312e-08, 0.0, 0.0, 0.0, 0.0, 1.4901161193847656e-08, 0.007475035395978441, 0.014932428903425287, 0.022390444275209427, 0.029839796898661286, 0.03725457802523665, 0.044713716467835625, 0.052226705191234866, 0.059491255482374036, 0.06592009801885658, 0.0720589710403432, 0.07791944517389068, 0.08351323345408045, 0.08885173235601805, 0.09394623033382524, 0.09880754677809579, 0.10344606697270566, 0.10787195250597584, 0.11209474408014322, 0.11612379584317765, 0.11996788686489379, 0.12363532010975294, 0.1271342531146318, 0.13047238235998845, 0.1336571176367779, 0.13669539637549177, 0.13959394835101827, 0.14235914274557274, 0.1449972005056557, 0.1475138679130114, 0.14991479737897764, 0.1522052245760849, 0.1543902760696271, 0.15647477473838922, 0.15846334809629709, 0.16036047145604643, 0.16217021941054902, 0.1638966732254458, 0.16554365825522374, 0.16711482873874994, 0.16861368339811264, 0.17004355257045467, 0.17140756698107737, 0.1727087172653354];

t5 = [0.0, 0.0989999771118164, 0.2199997901916504, 0.31599998474121094, 0.4049999713897705, 0.5049998760223389, 0.6150000095367432, 0.7049999237060547, 0.8139998912811279, 0.9039998054504395, 1.0069999694824219, 1.11899995803833, 1.2079999446868896, 1.306999921798706, 1.4119999408721924, 1.503999948501587, 1.6039998531341553, 1.7179999351501465, 1.804999828338623, 1.9149999618530273, 2.004999876022339, 2.1089999675750732, 2.2070000171661377, 2.307999849319458, 2.4079999923706055, 2.5139999389648438, 2.6059999465942383, 2.7089998722076416, 2.81499981880188, 2.921999931335449, 3.051999807357788, 3.171999931335449, 3.2699999809265137, 3.376999855041504, 3.4749999046325684, 3.559999942779541, 3.674999952316284, 3.7649998664855957, 3.871999979019165, 3.9619998931884766, 4.066999912261963, 4.161999940872192, 4.257999897003174, 4.375, 4.455999851226807, 4.567999839782715, 4.688999891281128, 4.82099986076355, 4.971999883651733, 5.103999853134155, 5.224999904632568, 5.312999963760376, 5.4059998989105225, 5.504999876022339, 5.607999801635742, 5.721999883651733, 5.810999870300293, 5.919999837875366, 6.019999980926514, 6.113999843597412, 6.2149999141693115, 6.304999828338623, 6.4049999713897705, 6.514999866485596, 6.616999864578247, 6.707000017166138, 6.829999923706055, 6.915999889373779, 7.017999887466431, 7.121999979019165, 7.222999811172485, 7.312999963760376, 7.429999828338623, 7.5309998989105225, 7.635999917984009, 7.723999977111816, 7.815999984741211, 7.916999816894531, 8.02899980545044, 8.113999843597412, 8.218999862670898, 8.322999954223633, 8.413999795913696, 8.523000001907349, 8.611999988555908, 8.717000007629395, 8.828999996185303, 8.916999816894531, 9.01799988746643, 9.116999864578247, 9.226999998092651, 9.32099986076355, 9.422999858856201, 9.514999866485596, 9.626999855041504, 9.728999853134155, 9.835999965667725, 9.946999788284302];
d5 = [1.0477378964424133e-09, 4.656612873077393e-10, 1.1176604530365604e-07, 1.4161635610294628e-07, 1.4163759966172042e-07, 3.003425057343598e-08, 7.859620760876804e-08, 5.854429193157776e-08, 6.751456380730542e-08, 1.7888076969620802e-07, 1.7915561578356405e-07, 1.0999960493280295e-07, 5.2229367946416446e-08, 1.4624401139064793e-07, 0.004694414748764392, 0.012923983382825207, 0.020774641062570952, 0.028263810031909226, 0.03540814791258345, 0.042223544961818356, 0.04872513707914988, 0.05492735982287205, 0.06084400050099098, 0.06648819830747164, 0.07187250013816561, 0.07700887539785066, 0.08190870866472562, 0.08658291510083163, 0.0910418883087461, 0.0952955301650491, 0.09935327317192093, 0.10322419225691118, 0.10691684065315282, 0.1104394885455876, 0.11379996664034425, 0.11700569566611303, 0.12006378350108883, 0.12298104749347893, 0.12576402181869853, 0.12841883830163234, 0.1309514052609862, 0.13336732553244346, 0.13567205295101764, 0.1378706539022134, 0.13996800114041888, 0.14196883320605902, 0.14387751616399397, 0.14569834153187453, 0.14743536245136993, 0.14909242344873608, 0.1506731901743476, 0.15218119424171173, 0.15361981824290766, 0.1549921616700268, 0.15630132382681708, 0.15755022523495077, 0.1587416524736781, 0.1598782133091371, 0.1609624707518502, 0.1619968089049016, 0.1629835524450465, 0.16392486203222736, 0.16482283880571102, 0.1656794646226661, 0.1664966766474221, 0.16727630776791808, 0.16802007154837936, 0.16872959231349913, 0.1694064644500275, 0.17005219293821522, 0.17066817861727127, 0.17125585198263346, 0.17181646464380015, 0.1723512535275637, 0.17286141069097227, 0.1733481579726574, 0.17381246411031243, 0.1742554465415151, 0.1746780292590127, 0.1750811957872474, 0.17546572075603975, 0.17583257301628094, 0.17618251234853322, 0.17651634343313208, 0.17683478167776215, 0.1771386465914269, 0.17742845948613184, 0.17770496569524877, 0.17796874625881934, 0.1782203374932772, 0.17846036547123217, 0.17868933683007593, 0.1789077731083303, 0.1791161958445406, 0.1793150369553712, 0.179504758477744, 0.17968570324977065, 0.17985833320559944];


t10 = [0.0, 0.12599992752075195, 0.2820000648498535, 0.40599989891052246, 0.5279998779296875, 0.6429998874664307, 0.753000020980835, 0.872999906539917, 0.9839999675750732, 1.062999963760376, 1.178999900817871, 1.2679998874664307, 1.3610000610351562, 1.4779999256134033, 1.5709998607635498, 1.6659998893737793, 1.7760000228881836, 1.8659999370574951, 1.9739999771118164, 2.065999984741211, 2.174999952316284, 2.2649998664855957, 2.372999906539917, 2.4689998626708984, 2.575000047683716, 2.6659998893737793, 2.7739999294281006, 2.863999843597412, 2.9789998531341553, 3.072999954223633, 3.174999952316284, 3.2869999408721924, 3.4070000648498535, 3.5260000228881836, 3.629999876022339, 3.7189998626708984, 3.82099986076355, 3.9099998474121094, 4.007999897003174, 4.116999864578247, 4.210000038146973, 4.32099986076355, 4.414000034332275, 4.506999969482422, 4.619999885559082, 4.718999862670898, 4.817999839782715, 4.908999919891357, 5.023999929428101, 5.115000009536743, 5.213000059127808, 5.304999828338623, 5.427000045776367, 5.516999959945679, 5.61899995803833, 5.721999883651733, 5.815000057220459, 5.925999879837036, 6.039999961853027, 6.119999885559082, 6.2149999141693115, 6.316999912261963, 6.427000045776367, 6.521999835968018, 6.622999906539917, 6.733999967575073, 6.86299991607666, 6.997999906539917, 7.123999834060669, 7.253999948501587, 7.375, 7.491999864578247, 7.622999906539917, 7.746999979019165, 7.86299991607666, 7.973999977111816, 8.092000007629395, 8.213000059127808, 8.32099986076355, 8.417999982833862, 8.503999948501587, 8.611000061035156, 8.713000059127808, 8.817999839782715, 8.907000064849854, 9.007999897003174, 9.111000061035156, 9.217999935150146, 9.307999849319458, 9.414000034332275, 9.51199984550476, 9.618000030517578, 9.74399995803833, 9.855999946594238, 9.97000002861023];
d10 = [4.75704401326259e-07, 9.337353001172695e-07, 1.3663248096093962e-06, 1.7880306856600175e-06, 2.1957892497072523e-06, 2.599073530770981e-06, 2.979324643136957e-06, 3.3506998249798623e-06, 3.7315365646264857e-06, 4.109490383046537e-06, 4.48153545445319e-06, 0.011070988211546604, 0.02608005518440494, 0.0410490782735699, 0.05587163097148612, 0.07001210431419368, 0.0829201743540442, 0.09523458710989981, 0.10698253412031154, 0.11818996613141076, 0.12888136047875787, 0.13908117802941297, 0.1488116441489174, 0.15809435359251778, 0.16694992304250342, 0.17539770063706353, 0.18345704992314932, 0.19114553893795336, 0.1984802226095585, 0.20547735287204213, 0.21215248414927446, 0.2185204401455676, 0.2245953508129933, 0.23039071266037486, 0.23591937421092682, 0.24119362897667743, 0.24622515759840924, 0.2510251171302243, 0.2556040453268556, 0.25997243392606045, 0.26413979115388253, 0.2681153747014454, 0.271907999582825, 0.27552608881940693, 0.27897767763484427, 0.2822704423463838, 0.2854116835595881, 0.2884083527748593, 0.29126713399758875, 0.2939943961269633, 0.29659615804564177, 0.29907815586925435, 0.30144602083987854, 0.30370489890184743, 0.3058597891007778, 0.30791551608587503, 0.3098766215844208, 0.31174750027643894, 0.31353230426244894, 0.3152349837392857, 0.3168593353536754, 0.3184089310084025, 0.3198871858866181, 0.32129738746112996, 0.3226425521274575, 0.3239257829638155, 0.3251499793029193, 0.32631782407307747, 0.32743194219167054, 0.328494751493862, 0.3295087008455686, 0.3304760125153515, 0.33139880707781094, 0.33227900488618295, 0.33311870198781174, 0.3339198269152281, 0.3346840552112644, 0.33541311166264076, 0.33610858015014783, 0.3367720802456338, 0.33740497962255656, 0.3380087277593482, 0.33858475832787444, 0.3391342462259055, 0.33965845390962046, 0.3401585518152084, 0.34063562746765863, 0.34109077991709136, 0.3415249756655801, 0.34193918772197895, 0.3423343052554273, 0.3427112994145239, 0.3430709056260507, 0.34341394018498583, 0.34374121603889773];

t15 = [0.0, 0.10699987411499023, 0.20600008964538574, 0.315000057220459, 0.40799999237060547, 0.503000020980835, 0.6059999465942383, 0.7049999237060547, 0.8039999008178711, 0.9049999713897705, 1.0169999599456787, 1.1119999885559082, 1.2060000896453857, 1.3050000667572021, 1.4089999198913574, 1.5120000839233398, 1.6099998950958252, 1.7109999656677246, 1.808000087738037, 1.9119999408721924, 2.006999969482422, 2.115999937057495, 2.2139999866485596, 2.296999931335449, 2.4170000553131104, 2.497999906539917, 2.61299991607666, 2.7160000801086426, 2.816999912261963, 2.9129998683929443, 2.996999979019165, 3.121000051498413, 3.2009999752044678, 3.316999912261963, 3.4029998779296875, 3.503000020980835, 3.6010000705718994, 3.700000047683716, 3.799999952316284, 3.9070000648498535, 4.004999876022339, 4.108999967575073, 4.2170000076293945, 4.315000057220459, 4.427000045776367, 4.5279998779296875, 4.63100004196167, 4.747999906539917, 4.854000091552734, 4.960000038146973, 5.062999963760376, 5.188999891281128, 5.302999973297119, 5.4100000858306885, 5.510999917984009, 5.608000040054321, 5.703999996185303, 5.795000076293945, 5.915999889373779, 6.003999948501587, 6.105999946594238, 6.194000005722046, 6.313999891281128, 6.414000034332275, 6.516000032424927, 6.63700008392334, 6.739000082015991, 6.8399999141693115, 6.934000015258789, 7.045000076293945, 7.1499998569488525, 7.25, 7.35699987411499, 7.460999965667725, 7.578999996185303, 7.684999942779541, 7.78600001335144, 7.9019999504089355, 8.002000093460083, 8.099999904632568, 8.194999933242798, 8.289000034332275, 8.38700008392334, 8.490000009536743, 8.589999914169312, 8.684000015258789, 8.780999898910522, 8.8989999294281, 8.990999937057495, 9.088000059127808, 9.187000036239624, 9.286999940872192, 9.384999990463257, 9.486999988555908, 9.58899998664856, 9.690999984741211, 9.795000076293945, 9.894000053405762, 9.98799991607666];
d15 = [7.152557373046875e-07, 1.430511474609375e-06, 2.1457672119140625e-06, 2.86102294921875e-06, 3.5762786865234375e-06, 4.291534423828125e-06, 5.0067901611328125e-06, 5.7220458984375e-06, 6.4373016357421875e-06, 7.152557373046875e-06, 7.867813110351562e-06, 8.58306884765625e-06, 9.298324584960938e-06, 1.0013580322265625e-05, 1.0728836059570312e-05, 1.1444091796875e-05, 0.010860670510383736, 0.03370593592242777, 0.05605607320812464, 0.0782582010612122, 0.09805724698076422, 0.11701369025926928, 0.13512110332195484, 0.15241198778654264, 0.1689131645022363, 0.18466307669180812, 0.19969337393592274, 0.21403562925795502, 0.22772057175655347, 0.2407773432551322, 0.25323532838424495, 0.26512127067422137, 0.27646084945773314, 0.28727981302357297, 0.2976015461907762, 0.30744876811965305, 0.31684321033519774, 0.3258055782071311, 0.3343556897954597, 0.34251247615168806, 0.35029396904271515, 0.3577174498558199, 0.3647993762207551, 0.37155547205822864, 0.37800072669349377, 0.3841494841825581, 0.390015369942738, 0.39561140493672037, 0.4009499655460713, 0.4060427557338194, 0.41090143175964766, 0.4155365672661923, 0.41995847355936533, 0.4241769275617109, 0.4282012707035649, 0.432040440476526, 0.43570295889195776, 0.4391969374307555, 0.4425301325672018, 0.4457099541503666, 0.44874344845735575, 0.45163730276186026, 0.45439787756601163, 0.45703147093642577, 0.45954386385395524, 0.4619405810882493, 0.464227009148529, 0.4664081426560158, 0.46848884770957827, 0.47047373796044495, 0.47236723775148426, 0.4741735481664463, 0.47589672101231467, 0.47754052780227096, 0.4791086420793432, 0.48060458200257006, 0.48203166592961644, 0.48339300176201144, 0.4846915644658294, 0.4859304099754881, 0.48711221927708287, 0.4882396687096854, 0.4893152621257785, 0.4903413384516719, 0.4913201387927729, 0.492253867261394, 0.4931446310247973, 0.49399439128417194, 0.4948050628517522, 0.49557845893758845, 0.4963162184748843, 0.4970199990926026, 0.49769138777228633, 0.498331879256027, 0.4989429408407073, 0.49952585707439073, 0.5000818748590768, 0.5006123304053856, 0.5011183678475187];

t19 = [0.0, 0.12599992752075195, 0.22900009155273438, 0.31800007820129395, 0.41100001335144043, 0.5130000114440918, 0.6089999675750732, 0.7239999771118164, 0.8310000896453857, 0.9270000457763672, 1.0440001487731934, 1.1570000648498535, 1.2650001049041748, 1.3600001335144043, 1.4930000305175781, 1.6000001430511475, 1.7009999752044678, 1.8400001525878906, 1.9470000267028809, 2.0440001487731934, 2.1449999809265137, 2.245000123977661, 2.3480000495910645, 2.450000047683716, 2.5429999828338623, 2.6510000228881836, 2.750999927520752, 2.8489999771118164, 2.940999984741211, 3.0450000762939453, 3.1440000534057617, 3.249000072479248, 3.3540000915527344, 3.452000141143799, 3.5510001182556152, 3.6489999294281006, 3.748000144958496, 3.8450000286102295, 3.944999933242798, 4.04200005531311, 4.14300012588501, 4.242000102996826, 4.33899998664856, 4.453999996185303, 4.549000024795532, 4.64300012588501, 4.740999937057495, 4.848999977111816, 4.943000078201294, 5.039000034332275, 5.1540000438690186, 5.248000144958496, 5.351999998092651, 5.449000120162964, 5.539999961853027, 5.63700008392334, 5.750999927520752, 5.8450000286102295, 5.949000120162964, 6.046000003814697, 6.140000104904175, 6.25, 6.3480000495910645, 6.454999923706055, 6.546999931335449, 6.644000053405762, 6.753999948501587, 6.8440001010894775, 6.959000110626221, 7.042999982833862, 7.140000104904175, 7.248000144958496, 7.352999925613403, 7.446000099182129, 7.562000036239624, 7.650000095367432, 7.746000051498413, 7.865999937057495, 7.9700000286102295, 8.056999921798706, 8.158999919891357, 8.252000093460083, 8.355000019073486, 8.467999935150146, 8.564000129699707, 8.663000106811523, 8.753000020980835, 8.860000133514404, 8.962000131607056, 9.051000118255615, 9.151000022888184, 9.25, 9.364000082015991, 9.45799994468689, 9.556999921798706, 9.664999961853027, 9.766999959945679, 9.860000133514404, 9.973000049591064, 10.07200002670288, 10.16100001335144, 10.266999959945679, 10.36899995803833, 10.463000059127808, 10.569999933242798, 10.654000043869019, 10.769000053405762, 10.870000123977661, 10.966000080108643, 11.07200002670288, 11.169000148773193, 11.2739999294281, 11.378000020980835, 11.485000133514404, 11.585999965667725, 11.706000089645386, 11.806999921798706, 11.910000085830688, 11.998000144958496, 12.108999967575073, 12.202000141143799, 12.299000024795532, 12.407000064849854, 12.502000093460083, 12.605999946594238, 12.703999996185303, 12.796000003814697, 12.910000085830688, 13.003999948501587, 13.108000040054321, 13.199000120162964, 13.309999942779541, 13.403000116348267, 13.499000072479248, 13.604000091552734, 13.700000047683716, 13.811000108718872, 13.901000022888184, 14.00600004196167, 14.105000019073486, 14.203999996185303, 14.305000066757202, 14.416000127792358, 14.502000093460083, 14.6010000705719, 14.700000047683716, 14.809999942779541, 14.906000137329102];
d19 = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.021994523673890553, 0.05026669589543063, 0.07973118500396485, 0.1056329442541739, 0.1303461374793826, 0.15392609060122459, 0.17642548613455608, 0.19788480991644217, 0.2183637246925933, 0.23788676324730107, 0.2565213849394493, 0.2743032412121556, 0.2912569654766331, 0.30742796289772334, 0.3228553740378933, 0.3375728903647074, 0.351613149599807, 0.3650072746401595, 0.377784990537987, 0.38997427317242517, 0.4016030989019673, 0.4126967770534675, 0.42327987291412605, 0.43337549286246985, 0.44300680345196286, 0.45219487322928287, 0.4609601383371106, 0.46932204793602783, 0.4772991309660569, 0.4849090327105659, 0.4921686758438446, 0.4990941258708655, 0.5057008400064557, 0.5120034855169697, 0.5180161053475254, 0.5237520588299582, 0.5292240687670575, 0.5344442172268257, 0.5394238471601167, 0.5441743608478983, 0.5487061863941365, 0.5530293609098694, 0.557153545198701, 0.5610879110709017, 0.5648412208338901, 0.5684218192879412, 0.5718376114182088, 0.5750961572370796, 0.5782047512878776, 0.5811702308525948, 0.5839992040602872, 0.5866978907954483, 0.5892723229665653, 0.5917281997129431, 0.5940710300963823, 0.5963060978396413, 0.5984382388223819, 0.6004723314543937, 0.6024128265178983, 0.6042640673658249, 0.6060300914523207, 0.6077147949630936, 0.6093219450205777, 0.6108550785375145, 0.6123177278742971, 0.6137129207036754, 0.6150439022990325, 0.6163135796512333, 0.6175247474035626, 0.6186801761517047, 0.6197823703472801, 0.620833833720592, 0.6218368816796794, 0.622793817065152, 0.6237066249365734, 0.6245774026944199, 0.6254081521528622, 0.6262007076811911, 0.6269568290345671, 0.62767815980014, 0.6283662727523313, 0.629022736835689, 0.629649018440002, 0.6302463809630258, 0.6308162300948583, 0.631359811791507, 0.6318783793155088, 0.6323731203528474, 0.6328450579746315, 0.6332952459266888, 0.6337247341234676, 0.6341344999470286, 0.6345254038884947, 0.6348983124013972, 0.6352540347186817, 0.6355933954373443, 0.635917057626398, 0.6362258765779621, 0.6365205349118204, 0.6368016339692469, 0.6370697737058153, 0.6373255987193591, 0.6375696751299359, 0.6378025013867697, 0.6380246300023911, 0.6382366909210825, 0.6384388278576865, 0.6386316700748741, 0.6388156211369462, 0.6389911037904722, 0.6391584522012662, 0.6393181693691853, 0.6394704778062662, 0.6396158135469702, 0.6397543781922899, 0.6398865411311034, 0.6400126215330572, 0.6401329120387286, 0.6402476885626052, 0.6403571753906905, 0.6404615469125623, 0.6405612213858537, 0.6406562141108876, 0.6407469081203353, 0.6408334355960055, 0.6409158683769409, 0.6409945818243311, 0.6410696760182448, 0.6411412712861685, 0.6412095748422375, 0.6412747890096331, 0.6413369475901738, 0.6413961604623513, 0.6414526669243643, 0.6415066773278288, 0.6415581462935489];


t20 = [0.0, 0.09299993515014648, 0.19099998474121094, 0.2980000972747803, 0.39300012588500977, 0.4850001335144043, 0.5950000286102295, 0.7269999980926514, 0.812000036239624, 0.9130001068115234, 1.0260000228881836, 1.125999927520752, 1.2200000286102295, 1.314000129699707, 1.4290001392364502, 1.5239999294281006, 1.6129999160766602, 1.7290000915527344, 1.8270001411437988, 1.9200000762939453, 2.0190000534057617, 2.121999979019165, 2.2150001525878906, 2.324000120162964, 2.4230000972747803, 2.5139999389648438, 2.623000144958496, 2.7179999351501465, 2.811000108718872, 2.9260001182556152, 3.0199999809265137, 3.121999979019165, 3.2190001010894775, 3.3259999752044678, 3.4260001182556152, 3.5280001163482666, 3.6419999599456787, 3.758000135421753, 3.8580000400543213, 3.9600000381469727, 4.065999984741211, 4.1579999923706055, 4.258000135421753, 4.365999937057495, 4.463000059127808, 4.569000005722046, 4.661999940872192, 4.760999917984009, 4.873000144958496, 4.976999998092651, 5.0940001010894775, 5.200000047683716, 5.28600001335144, 5.398999929428101, 5.496999979019165, 5.5959999561309814, 5.694000005722046, 5.802999973297119, 5.88700008392334, 6.008000135421753, 6.121000051498413, 6.2250001430511475, 6.319999933242798, 6.421000003814697, 6.533999919891357, 6.635999917984009, 6.73799991607666, 6.874000072479248, 7.0, 7.098999977111816, 7.21399998664856, 7.319000005722046, 7.419000148773193, 7.519999980926514, 7.61299991607666, 7.706000089645386, 7.822000026702881, 7.908999919891357, 8.01200008392334, 8.101999998092651, 8.21500015258789, 8.305000066757202, 8.416000127792358, 8.508000135421753, 8.614000082015991, 8.70900011062622, 8.806999921798706, 8.91700005531311, 9.01200008392334, 9.108000040054321, 9.217000007629395, 9.309000015258789, 9.414000034332275, 9.503999948501587, 9.61299991607666, 9.70799994468689, 9.805999994277954, 9.903000116348267];
d20 = [9.5367431640625e-07, 1.6093254089355469e-06, 2.086162567138672e-06, 2.562999725341797e-06, 3.039836883544922e-06, 3.516674041748047e-06, 3.993511199951172e-06, 4.32133674621582e-06, 4.32133674621582e-06, 4.32133674621582e-06, 0.016406957912320268, 0.04617229304452248, 0.07634796031564055, 0.10671327248318244, 0.13368087319378735, 0.15942766675198505, 0.18400148505064368, 0.2074926283086437, 0.22986431266276933, 0.25122464572899933, 0.2715929271789038, 0.2910191677303041, 0.3095519672860367, 0.32724005925312477, 0.3441146811953557, 0.3602125328680136, 0.37557049613614957, 0.39022210336538377, 0.40419936472307555, 0.4175342513032472, 0.43025572770974335, 0.44239155922979717, 0.4539694813511873, 0.46501466330797137, 0.4755514831120791, 0.48560326215874716, 0.4951923885590132, 0.5043401859609613, 0.51306672795085, 0.5213920322527551, 0.5293342326828593, 0.5369109442455434, 0.5441390087494282, 0.5510344462144381, 0.5576125983588903, 0.5638880754529796, 0.5698747668010665, 0.5755858753674943, 0.5810340896242102, 0.58623148121489, 0.5911895525806282, 0.5959193284011169, 0.6004313881322542, 0.6047357537811835, 0.608842033044235, 0.6127593378865287, 0.6164963643290827, 0.6200614425281348, 0.6234624491622327, 0.6267069958151311, 0.6298021256649188, 0.63275481731254, 0.6355715938320089, 0.638258718035678, 0.6408222298227477, 0.6432676662843744, 0.6456006253708443, 0.6478262593366462, 0.6499493853411401, 0.6519747719535711, 0.6539068717960954, 0.655750009155815, 0.6575082916541233, 0.6591855604434846, 0.6607856014637212, 0.6623119697443618, 0.6637680636869779, 0.6651571638617282, 0.6664823521482566, 0.6677464562192612, 0.6689524554753372, 0.6701029570781637, 0.6712004490385395, 0.6722474082346813, 0.6732462524808093, 0.6741990726160075, 0.6751080218273056, 0.6759750652553761, 0.6768023019146063, 0.6775914315559497, 0.6783442144095296, 0.6790622944626615, 0.6797473389458584, 0.6804008374492914, 0.6810243336778278, 0.6816191093868783, 0.6821865376247372, 0.6827278311865838];

epsilon = 0.0001
[t5, d5] = removeBegining(t5,d5, epsilon, 1);
[t10, d10] = removeBegining(t10,d10, epsilon, 1);
[t15, d15] = removeBegining(t15,d15, epsilon, 1);
[t19, d19] = removeBegining(t19,d19, epsilon, 1);
[t20, d20] = removeBegining(t20,d20, epsilon, 1);

plot(t5, d5./5, t10, d10./10, t15, d15./15, t19, d19./19, t20, d20./20, t20, 0.022*ones(1,length(t20)), t19, d(t19), 'r', t19, d_dot(t19), 'r')
title('distance of ball after shoot depending on time')
legend('v=5', 'v=10', 'v=15', 'v=19', 'v=20')

% vmotora =25, vrobot measure = 0.375
k = 25/0.3751   % 66.65
t=[0.0, 0.09800004959106445, 0.20000004768371582, 0.2970001697540283, 0.40400004386901855, 0.501000165939331, 0.6000001430511475, 0.6980001926422119, 0.7970001697540283, 0.8930001258850098, 1.004000186920166, 1.1050000190734863, 1.1990001201629639, 1.2950000762939453, 1.4060001373291016, 1.505000114440918, 1.5980000495910645, 1.6990001201629639, 1.7960000038146973, 1.8940000534057617, 1.9940001964569092, 2.0980000495910645, 2.2009999752044678, 2.2950000762939453, 2.3960001468658447, 2.494000196456909, 2.6019999980926514, 2.705000162124634, 2.80400013923645, 2.9030001163482666, 3.0, 3.1070001125335693, 3.2009999752044678, 3.2940001487731934, 3.4050002098083496, 3.503000020980835, 3.6019999980926514, 3.698000192642212, 3.809000015258789, 3.9160001277923584, 4.01800012588501, 4.120000123977661, 4.209000110626221, 4.311000108718872, 4.4100000858306885, 4.513000011444092, 4.605000019073486, 4.706000089645386, 4.813000202178955, 4.9040000438690186, 5.009000062942505, 5.117000102996826, 5.210000038146973, 5.319000005722046, 5.40500020980835, 5.509000062942505, 5.634999990463257, 5.707000017166138, 5.809000015258789, 5.916000127792358, 6.009000062942505, 6.111999988555908, 6.209000110626221, 6.308000087738037, 6.41100001335144, 6.509000062942505, 6.605000019073486, 6.712000131607056, 6.812000036239624, 6.9100000858306885, 7.004000186920166, 7.105000019073486, 7.239000082015991, 7.317000150680542, 7.4150002002716064, 7.508000135421753, 7.610000133514404, 7.71399998664856, 7.814000129699707, 7.913000106811523, 8.015000104904175, 8.116000175476074, 8.216000080108643, 8.317000150680542, 8.40500020980835, 8.517000198364258, 8.617000102996826, 8.705000162124634, 8.808000087738037, 8.916000127792358, 9.013000011444092, 9.116000175476074, 9.213000059127808, 9.312000036239624, 9.403000116348267, 9.517000198364258, 9.614000082015991, 9.71500015258789, 9.81000018119812, 9.915000200271606, 10.014000177383423, 10.110000133514404, 10.21500015258789, 10.318000078201294, 10.416000127792358, 10.513000011444092, 10.611000061035156, 10.712000131607056, 10.813000202178955, 10.914000034332275, 11.009999990463257, 11.109000205993652, 11.212000131607056, 11.309000015258789, 11.412000179290771, 11.511000156402588, 11.609000205993652, 11.712000131607056, 11.809000015258789, 11.916000127792358, 12.015000104904175, 12.114000082015991, 12.207000017166138, 12.313000202178955, 12.41700005531311, 12.511000156402588, 12.608000040054321, 12.716000080108643, 12.811000108718872, 12.903000116348267, 13.013000011444092, 13.105000019073486, 13.203999996185303, 13.314000129699707, 13.414000034332275, 13.511000156402588, 13.616000175476074, 13.711000204086304, 13.808000087738037, 13.906000137329102, 14.009000062942505, 14.105000019073486, 14.20900011062622, 14.305999994277954, 14.40500020980835, 14.505000114440918, 14.614000082015991, 14.702000141143799, 14.812000036239624, 14.909000158309937];
db=[5.587935447692871e-09, 4.6566128730773926e-09, 5.587935447692871e-09, 4.6566128730773926e-09, 5.587935447692871e-09, 9.313225746154785e-10, 7.450580596923828e-09, 2.7939677238464355e-09, 5.587935447692871e-09, 5.587935447692871e-09, 9.313225746154785e-10, 5.587935447692871e-09, 4.6566128730773926e-09, 7.450580596923828e-09, 4.6566128730773926e-09, 5.587935447692871e-09, 2.7939677238464355e-09, 5.587935447692871e-09, 9.313225746154785e-10, 5.587935447692871e-09, 7.450580596923828e-09, 5.587935447692871e-09, 5.587935447692871e-09, 0.036675218250838706, 0.07408740848696123, 0.10960659010410746, 0.14205375282317018, 0.17301558670008066, 0.20255085838043813, 0.230731635812239, 0.257620316195753, 0.2832699481104434, 0.30773743683378624, 0.33107804454288625, 0.3533388554996598, 0.374574280038019, 0.39483338958588204, 0.4141638490520223, 0.43260300973482724, 0.4501912176949805, 0.46696539918774166, 0.48296804752893074, 0.49823405858799746, 0.5127972509175945, 0.524842204891677, 0.5342947871044942, 0.5434207594759214, 0.5537145247976564, 0.5678415944465491, 0.5870398008667865, 0.611015000393912, 0.6396838655515171, 0.6729613524483632, 0.7106972174122701, 0.7527075521079781, 0.7992696788796283, 0.850831606303078, 0.9071542033605188, 0.9680061277090177, 1.0088452901385294, 1.0083001093353006, 1.0079917981751454, 1.0077161044751908, 1.007468922457048, 1.0072476326795186, 1.0070501195361978, 1.0068743220020415, 1.0067185120822564, 1.0065809029497397, 1.0064599902733316, 1.0063542082623647, 1.00626228231965, 1.0061830317010874, 1.006115284725468, 1.006057993684958, 1.00601022794472, 1.0059710583166568, 1.0059396694612, 1.0059153200369373, 1.0058973302205374, 1.0058850571710964, 1.005877944071141, 1.0058754530469578, 1.0058770958342689, 1.0058824324586817, 1.0058910436950381, 1.005902568553657, 1.0059166610909647, 1.0059330123275365, 1.0059513292031217, 1.005971350903054, 1.005992855254411, 1.0060156064493877, 1.0060394249737228, 1.0060641651918591, 1.0060896107109063, 1.006115627045322, 1.0061421449903893, 1.0061689678724588, 1.0061960121840012, 1.0062232085941794, 1.0062504355673558, 1.0062776126363508, 1.0063047045688447, 1.0063316668865103, 1.006358364931759, 1.0063847935496475, 1.0064109235938241, 1.006436680717578, 1.006462084816218, 1.0064871126475199, 1.0065117145474043, 1.0065358866916572, 1.006559556065578, 1.0065827544970976, 1.0066054743205932, 1.0066276989147935, 1.006649437941724, 1.006670683203756, 1.0066914069784876, 1.0067116112248693, 1.0067313239862277, 1.006750526620704, 1.0067691902825617, 1.006787352513736, 1.0068050695186936, 1.006822285974253, 1.0068390174142516, 1.0068552567378373, 1.006871043343382, 1.0068863945771576, 1.0069012333996903, 1.0069156398993402, 1.0069296594071808, 1.0069432603998845, 1.0069564273782496, 1.0069691745870006, 1.0069814777307782, 1.0069934544969503, 1.0070050390810672, 1.0070162758608725, 1.007027146699171, 1.0070376610112337, 1.0070478572844168, 1.0070577006078123, 1.0070672519662063, 1.0070764840730129, 1.0070854147104862, 1.0070940346503339, 1.0071023589956278];
dr=[0.0, 0.002616860212002246, 0.027635969021842174, 0.06311578587367571, 0.09835876555154303, 0.13457254099053625, 0.17139203135646186, 0.2083085363437938, 0.24535749464580592, 0.28247195157605004, 0.3198432072051523, 0.35721201069045316, 0.39465941698061674, 0.43215720649995165, 0.46946368172124536, 0.5069331064505775, 0.5443697241826341, 0.5817930484605492, 0.6192885889910648, 0.6565716581319492, 0.6940849550288969, 0.7314495929465606, 0.7687705163324182, 0.8062156955891502, 0.8432921413141171, 0.8806879609518475, 0.9063325833772244, 0.8859941200934464, 0.8487790266952219, 0.8191782357484534, 0.8319822564737063, 0.8675892011178465, 0.895262221377961, 0.8805579481672136, 0.8553596650841915, 0.8547615751462744, 0.8673417345419979, 0.8778413191084622, 0.8792683075917582, 0.8771526485015206, 0.8693480545121638, 0.8520605143840607, 0.8386216774982193, 0.8440942568806473, 0.8475062832559638, 0.8476698572759154, 0.8540139850076763, 0.8621139581721683, 0.8442066476255209, 0.8208506837165125, 0.8229890621193817, 0.840977376480853, 0.8626616096625429, 0.8732815313573322, 0.8752836273348774, 0.8739147253154189, 0.8650534179765023, 0.8560926278848647, 0.8567181279208362, 0.8631760792120244, 0.8591815827244605, 0.8448457424170266, 0.8345454516085771, 0.8286339353981069, 0.8233702154447067, 0.8285498507745824, 0.8531382716704244, 0.8737027393890516, 0.873103662025841, 0.8590593001528569, 0.8509182886219362, 0.8595569560340127, 0.8743411263189365, 0.88003574388324, 0.8852820761143466, 0.8897253254867972, 0.8804203297442605, 0.8533487386473163, 0.8322747974979189, 0.8477154772326208, 0.8607077297661166, 0.8572786644267427, 0.8468417599719299, 0.8424669076343886, 0.8401860369180691, 0.8305711904882864, 0.8337226820830956, 0.8549852961147084, 0.8738016103504109, 0.8677681693516862, 0.8622444008074752, 0.8637581549449086, 0.8678694282819708, 0.8686822897513322, 0.8715902429504303, 0.8807156277799246, 0.8761980745377042, 0.8509587159155088, 0.8318163521248181, 0.8441861508722018, 0.8527828790474492, 0.8524280624034534, 0.8541569720520164, 0.860253450311953, 0.8492495750098102, 0.8267708218445385, 0.8189844032971648, 0.830733818147256, 0.8560443959955198, 0.869393343691573, 0.8599404912071612, 0.8530517920608396, 0.8586396423511801, 0.8671833728658694, 0.8703306175257339, 0.877151698005301, 0.8854199371433898, 0.8838624332496234, 0.8635434634799863, 0.8449298567356126, 0.8432885891720845, 0.8558806202995818, 0.8616492117062213, 0.8518670697516668, 0.839879312720784, 0.8357983897102833, 0.8280818786855223, 0.8221415192671638, 0.8337655424201418, 0.8639469743367658, 0.8874918361580113, 0.8712592399042887, 0.8539067374394063, 0.8528181998883096, 0.8613101816241837, 0.8672895578343204, 0.8681507463590867, 0.8807041402880669, 0.8941473819598982, 0.8926509094863277, 0.8690582591917814, 0.8406356859865807, 0.8216831027488918, 0.8349547699232247, 0.848818252265332, 0.8487356292401956, 0.8452222147277831, 0.84843761998025, 0.8524274777842192, 0.834497527398804];
figure 
dr_dot = (dr(1:end-1)-dr(2:end))./(t(1:end-1)-t(2:end));
plot(t, db, t, dr, t(1:end-1), dr_dot)

