100 'Version221:Date2020.06.22:Ver20191227より改変
110 'Version223:Date2020.06.23:Ver20191227より改変
120 'Version224:Date2020.06.24:Ver20191227より改変
130 'Version225:Date2020.06.25:Ver20191227より改変
140 'Version226:Date2020.06.26:Ver20191227より改変
150 'Version227:Date2020.06.27:Ver20191227より改変
160 'Version228:Date2020.06.29:Ver20191227より改変
170 'Version229:Date2020.06.30:ver20191227より改変
180 'Version230:Date2020.07.02:Ver20191227より改変
190 'Version231:Date2020.07.03:Ver20191227より改変
200 'Version232:Date2020.07.04:Ver20191227より改変
210 'Version233:Date2020.07.12:Ver20191227より改変
220 'Version234:Date2020.07.13:Ver20191227より改変
230 'Version235:Date2020.07.15:Ver20191227より改変
240 'Version235_02:Date:2020.11.02:Version235表示不具合修正
250 'Version23601:Date:2020.11.04:Ver202009より改変
260 'Version23602:Date:2020.11.06:Ver202009より改変
270 '初期設定項目
280 'メモリー定義 文字データー3倍 ,数値データー2倍
290 clear 3.0*4000,2.0*100000
300 counts=0
310 dim  buf_namearray$(10),name_array$(10),buf_namearray2$(10),name_array2$(10),buf_lines$(3*10),buffLines$(20),count$(10),count1$(10),count2$(10)
320 '性別の選択用変数
330 dim sex_type$(2)
340 '相性占い　設定項目 ここから
350 count=0:N=0:n=0
360 dim buffer_Aisyou_type$(10,10)
370 dim buffer_Kaimei_data_name$(10)
380 '総数を出す変数 改名チェック変数
390 'dim buffer_total$
400 '1.理解し合える最良のカップル
410 dim buf_good_couple1(20)
420 dim buf_good_couple2(20)
430 '2.互いに自然体でつきあえるカップル
440 dim buf_natural_couple1(20)
450 dim buf_natural_couple2(20)
460 '3.男性にとって居心地の良い相性
470 dim buf_good_for_man1(20)
480 dim buf_good_for_man2(20)
490 '4.女性にとって居心地の良い相性
500 dim buf_good_for_woman1(20)
510 dim buf_good_for_woman2(20)
520 '5.恋愛経験を重ねた後なら愛を育める
530 dim short_of_experience1(20)
540 dim short_of_experience2(20)
550 '6.結婚への発展が困難なカップル
560 dim buf_difficult_for_couple1(20)
570 dim buf_difficult_for_couple2(20)
580 '7.愛し方にズレが出てくる二人
590 dim buf_difference_of_love1(20)
600 dim buf_difference_of_love2(20)
610 '相性占い　設定項目　ここまで
620 '8.互いの価値観が噛み合わない相性 ここから
630 dim buf_difference_of_KachiKan1(20)
640 dim buf_difference_of_KachiKan2(20)
650 '8.互いに価値観が噛み合わない相性 ここまで
660 '相性診断　相性パターン結果　ここから
670 dim Result_Aisyou_type$(8)
680 '相性診断 相性パターン結果 ここまで
690 '2019/04/07 姓名判断アプリ 作成開始
700 '姓名判断　 名前の総数での吉凶を調べる
710 buf_count=0:buffer_count=0:count=0:buffer=0
720 '合計文字数
730 totalmoji=0
740 dim buf_Input_data$(10),buf_Input_data2$(10)
750 dim bufer_name$(10),bufer_name2$(10)
760 dim buf_Input_name$(10),buf_Input_name2$(10)
770 '定数文字1画〜24画
780 Moji_1=29:Moji_2=79:Moji_3=100:Moji_4=113:Moji_5=135:Moji_6=177:Moji_7=191:Moji_8=287:Moji_9=275:Moji_10=291:Moji_11=297:Moji_12=196:Moji_13=230:Moji_14=156:Moji_15=151:Moji_16=107:Moji_17=63:Moji_18=25:Moji_19=17:Moji_20=13:Moji_21=6:Moji_22=4:Moji_23=3:Moji_24=3
790 Moji_total=Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20+Moji_21+Moji_22+Moji_23+Moji_24
800 '1画
810 Moji_Min_1=1:Moji_Max_1=Moji_1+1:
820 '2画
830 Moji_Min_2=(Moji_1)+2:Moji_Max_2=Moji_1+Moji_2+2
840 '3画
850 Moji_Min_3 =(Moji_1) + (Moji_2) + 3:Moji_Max_3 =Moji_1 + Moji_2 + Moji_3+3
860 '4画
870 Moji_Min_4 = (Moji_3) + Moji_2 + Moji_1 + 4:Moji_Max_4=Moji_1+Moji_2 + Moji_3 + Moji_4 + 4
880 '5画
890 Moji_Min_5 = (Moji_1 + Moji_2 + Moji_3 + Moji_4) + 5:Moji_Max_5 = (Moji_1 + Moji_2 + Moji_3 + Moji_4 + Moji_5)+5
900 '6画
910 Moji_Min_6 = (Moji_1+Moji_2+Moji_3+Moji_4+Moji_5)+6:Moji_Max_6=(Moji_1 + Moji_2 + Moji_3 + Moji_4 + Moji_5 + Moji_6)+6
920 '7画
930 Moji_Min_7 = (Moji_1 + Moji_2 + Moji_3 + Moji_4 + Moji_5 + Moji_6) + 7:Moji_Max_7 = (Moji_1 + Moji_2 + Moji_3 + Moji_4 + Moji_5 + Moji_6 + Moji_7) + 7
940 '8画
950 Moji_Min_8 = Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+8:Moji_Max_8=(Moji_1 + Moji_2 + Moji_3 + Moji_4 + Moji_5 + Moji_6 + Moji_7 + Moji_8)+8
960 '9画
970 Moji_Min_9 = Moji_1 + Moji_2 + Moji_3 + Moji_4 + Moji_5 + Moji_6 + Moji_7 + Moji_8 + 9:Moji_Max_9 = Moji_1 + Moji_2 + Moji_3 + Moji_4 + Moji_5 + Moji_6 + Moji_7 + Moji_8 + Moji_9 + 9
980 '10画
990 Moji_Min_10 = (Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9)+10:Moji_Max_10=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10)+10
1000 '11画
1010 Moji_Min_11 = (Moji_1+Moji_2+Moji_3+Moji_4 + Moji_5 + Moji_6 + Moji_7 + Moji_8 + Moji_9 + Moji_10)+11:Moji_Max_11=(Moji_1 + Moji_2 + Moji_3 + Moji_4 + Moji_5 + Moji_6 + Moji_7 + Moji_8 + Moji_9 + Moji_10 + Moji_11)+11
1020 '12画
1030 Moji_Min_12 = (Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11)+12:Moji_Max_12=Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+12
1040 '13画
1050 Moji_Min_13=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12)+13:Moji_Max_13=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13)+13
1060 '14画
1070 Moji_Min_14 =(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13)+14:Moji_Max_14=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14)+14
1080 '15画
1090 Moji_Min_15 = (Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14)+15:Moji_Max_15=(Moji_1 + Moji_2 + Moji_3 + Moji_4 + Moji_5 + Moji_6+ Moji_7 + Moji_8 + Moji_9+ Moji_10 + Moji_11 + Moji_12+Moji_13+Moji_14+Moji_15)+15
1100 '16画
1110 Moji_Min_16 = (Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15)+16:Moji_Max_16=Moji_1 + Moji_2 + Moji_3 + Moji_4 + Moji_5 + Moji_6 + Moji_7 + Moji_8 + Moji_9 + Moji_10 + Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+16
1120 '17画
1130 Moji_Min_17 = (Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16) + 17:Moji_Max_17 = Moji_1 + Moji_2 + Moji_3 + Moji_4+Moji_5 + Moji_6 + Moji_7+Moji_8 + Moji_9 + Moji_10 + Moji_11 + Moji_12 + Moji_13 + Moji_14 + Moji_15+Moji_16+Moji_17+17
1140 '18画
1150 Moji_Min_18 = (Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17)+18:Moji_Max_18 = (Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18)+18
1160 '19画
1170 Moji_Min_19=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18)+19:Moji_Max_19=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19)+19
1180 '20画
1190 Moji_Min_20=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19)+20:Moji_Max_20=Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20+20
1200 '21画
1210 Moji_Min_21=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20)+21:Moji_Max_21=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20+Moji_21)+21
1220 '22画
1230 Moji_Min_22=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20+Moji_21)+22:Moji_Max_22=Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20+Moji_21+Moji_22+22
1240 '23画
1250 Moji_Min_23=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20+Moji_21+Moji_22):Moji_Max_23=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20+Moji_21+Moji_22+Moji_23)
1260 '24画
1270 Moji_Min_24=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20+Moji_21+Moji_22+Moji_23)+24:Moji_Max_24=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20+Moji_21+Moji_22+Moji_23+Moji_24)+24
1280 dim Moji_data$(Moji_total+24)
1290 'dim bufmoji$(10),Input_data$(10)
1300 '１画の文字   サイズ:21+2(漢字)
1310 dim buf_char_hiragana1$(Moji_1)
1320 '2画の文字  サイズ 58+14=72(漢字)
1330 dim buf_char_hiragana2$(Moji_2)
1340 '3画の文字 サイズ:48+29=77(漢字)
1350 dim buf_char_hiragana3$(Moji_3)
1360 '4画の文字 サイズ:29+51=80(漢字)
1370 dim buf_char_hiragana4$(Moji_4)
1380 '５画の文字  サイズ:18+59=77(漢字)
1390 dim buf_char_hiragana5$(Moji_5)
1400 '6画の文字  サイズ:79(漢字)
1410 dim buf_char_hiragana6$(Moji_6)
1420 '7画の文字  サイズ:88(漢字)
1430 dim buf_char_hiragana7$(Moji_7)
1440 '8画の文字
1450 dim buf_char_hiragana8$(Moji_8)
1460 '9画の文字
1470 dim buf_char_hiragana9$(Moji_9)
1480 '10画の文字 98文字
1490 dim buf_char_hiragana10$(Moji_10)
1500 '11画の文字
1510 dim buf_char_hiragana11$(Moji_11)
1520 '12画の文字
1530 dim buf_char_hiragana12$(Moji_12)
1540 '13画の文字 81文字
1550 dim buf_char_hiragana13$(Moji_13)
1560 '14画の文字
1570 dim buf_char_hiragana14$(Moji_14)
1580 '15画の文字
1590 dim buf_char_hiragana15$(Moji_15)
1600 '16画の文字
1610 dim buf_char_hiragana16$(Moji_16)
1620 '17画の文字
1630 dim buf_char_hiragana17$(Moji_17)
1640 '18画の文字
1650 dim buf_char_hiragana18$(Moji_18)
1660 '19画の文字
1670 dim buf_char_hiragana19$(Moji_19)
1680 '20画の文字
1690 dim buf_char_hiragana20$(Moji_20)
1700 '21画の文字
1710 dim buf_char_hiragana21$(Moji_21)
1720 '22画の文字
1730 dim buf_char_hiragana22$(Moji_22)
1740 '23画の文字
1750 dim buf_char_hiragana23$(Moji_23)
1760 '24画の文字
1770 dim buf_char_hiragana24$(Moji_24)
1780 '結果表示1　吉凶データー 81パターン
1790 dim buf_Kikkyo$(81)
1800 '結果表示２
1810 '安斎流姓名判断 吉凶  1.地運
1820 dim buf_Kikkyo_Anzai_chiunn$(70)
1830 '安斎流姓名判断　　吉凶  2.人運
1840 dim buf_Kikkyo_Anzai_jinunn$(69)
1850 '安斎流姓名判断 吉凶 3.外運
1860 'dim buf_Kikkyo_Anzai_gaiunn$(70)
1870 '安斎流姓名判断 吉凶　　4.総運
1880 dim buf_Kikkyo_Anzai_total$(80)
1890 'データー読み込み　ここから
1900 'データー読み込み　1.ひらがな
1910 '1画の文字   6文字 23文字
1920 open "config/Kanji_data/Mojidata.dat" for input as #1
1930 '全ファイルを読み込む
1940 j=0:
1950 for i = 1 to ((Moji_total + 24)-1)
1960 input #1,Moji_data$(i-1)
1970 next i
1980 close #1
1990 '全ファイル読み込み　ここまで
2000 for n=1 to (Moji_1)-1
2010 '1画の文字にデーターをコピーする
2020 buf_char_hiragana1$(n-1) = Moji_data$(n+1)
2030 next n
2040 '2画の文字    73文字
2050 for i = Moji_Min_2  to (Moji_Max_2)-1
2060 buf_char_hiragana2$(i-Moji_Min_2)=Moji_data$(i+1)
2070 next i
2080 '3文字の文字    77文字
2090 for i = Moji_Min_3  to (Moji_Max_3)-1
2100 buf_char_hiragana3$(i-(Moji_Min_3)) = Moji_data$(i+1)
2110 next i
2120 '4文字の文字   80文字
2130 for i = (Moji_Min_4)  to (Moji_Max_4)-1
2140 buf_char_hiragana4$(i-Moji_Min_4)=Moji_data$(i+1)
2150 next i
2160 '5文字の文字 77文字
2170 for i = Moji_Min_5 to (Moji_Max_5) - 1
2180 buf_char_hiragana5$(i - Moji_Min_5)=Moji_data$(i+1)
2190 next i
2200 '6文字の文字 79文字
2210 for i = Moji_Min_6  to Moji_Max_6
2220 buf_char_hiragana6$(i-Moji_Min_6) = Moji_data$(i+1)
2230 next i
2240 '7文字の文字 170文字
2250 for i = Moji_Min_7 to Moji_Max_7
2260 buf_char_hiragana7$(i-Moji_Min_7)=  Moji_data$(i+1)
2270 next i
2280 '8画の文字 120文字
2290 for i = Moji_Min_8 to Moji_Max_8
2300 buf_char_hiragana8$(i - Moji_Min_8)=Moji_data$(i+1)
2310 next i
2320 '9画の文字  103文字
2330 for i = Moji_Min_9 to Moji_Max_9
2340 buf_char_hiragana9$(i - Moji_Min_9)=Moji_data$(i+1)
2350 next i
2360 '10画の文字 285文字
2370 for i = Moji_Min_10 to (Moji_Max_10)
2380 buf_char_hiragana10$(i-Moji_Min_10)=Moji_data$(i+1)
2390 next i
2400 '11画の文字
2410 for i = Moji_Min_11 to Moji_Max_11
2420 buf_char_hiragana11$(i-Moji_Min_11)=Moji_data$(i+1)
2430 next i
2440 '12画の文字
2450 for i = Moji_Min_12 to (Moji_Max_12)
2460 buf_char_hiragana12$(i-Moji_Min_12)=Moji_data$(i+1)
2470 next i
2480 '13画の文字 81
2490 for i = Moji_Min_13 to (Moji_Max_13)
2500 buf_char_hiragana13$(i-Moji_Min_13)=Moji_data$(i+1)
2510 next i
2520 '14画の文字 66
2530 for i = Moji_Min_14 to Moji_Max_14
2540 buf_char_hiragana14$(i-Moji_Min_14)=Moji_data$(i+1)
2550 next i
2560 '15画の文字 59
2570 'for i = Moji_Min_15 to (Moji_Max_15) - 1
2580 for i=Moji_Min_15 to Moji_Max_15
2590 buf_char_hiragana15$(i-Moji_Min_15)=Moji_data$(i+1)
2600 next i
2610 '16画の文字 44
2620 for i=Moji_Min_16 to Moji_Max_16
2630 buf_char_hiragana16$(i-Moji_Min_16)=Moji_data$(i+1)
2640 next i
2650 '17画の文字
2660 for i = Moji_Min_17 to Moji_Max_17
2670 buf_char_hiragana17$(i-Moji_Min_17)=Moji_data$(i+1)
2680 next i
2690 '18画の文字
2700 for i = Moji_Min_18 to Moji_Max_18
2710 buf_char_hiragana18$(i-Moji_Min_18)=Moji_data$(i+1)
2720 next i
2730 '19画の文字 17文字
2740 for i = Moji_Min_19 to Moji_Max_19
2750 buf_char_hiragana19$(i-Moji_Min_19)=Moji_data$(i+1)
2760 next i
2770 '20 画の文字 13文字
2780 for  i = Moji_Min_20 to Moji_Max_20
2790 buf_char_hiragana20$(i-Moji_Min_20)=Moji_data$(i+1)
2800 NEXT i
2810 '21画の文字 6
2820 for i = Moji_Min_21 to Moji_Max_21
2830 buf_char_hiragana21$(i-Moji_Min_21)=Moji_data$(i+1)
2840 next i
2850 '22 画の文字 4
2860 for i = Moji_Min_22 to Moji_Max_22
2870 buf_char_hiragana22$(i-Moji_Min_22)=Moji_data$(i+1)
2880 next i
2890 '23画の文字  3文字
2900 for i = Moji_Min_23 to Moji_Max_23
2910 buf_char_hiragana23$(i-Moji_Min_23)=Moji_data$(i+1)
2920 next i
2930 '24画の文字  3文字
2940 for i = Moji_Min_24 to Moji_Max_24-1
2950 buf_char_hiragana24$(i-Moji_Min_24)=Moji_data$(i+1)
2960 next i
2970 '吉凶データー読み込み
2980 open "config/Kikkyo_data/Kikkyo_data.dat" for input as #1
2990 for i=0 to 80
3000 input #1,buf_Kikkyo$(i)
3010 next i
3020 close #1
3030 open "config/Anzai_Kikkyo/Anzai_Kikkyo_chiunn.dat" for input as #1
3040 for m=0 to 69
3050 input #1,buf_Kikkyo_Anzai_chiunn$(m)
3060 next m
3070 close #1
3080 open "config/Anzai_Kikkyo/Anzai_Kikkyo_jinunn.dat" for input as #1
3090 for i=1 to 70
3100 input #1,buf_Kikkyo_Anzai_jinunn$(i-1)
3110 next i
3120 close #1
3130 open "config/Anzai_Kikkyo/Anzai_Kikkyo_Total.dat" for input as #1
3140 for i=0 to 79
3150 input #1,buf_Kikkyo_Anzai_total$(i)
3160 next i
3170 close #1
3180 restore 4010
3190 for i=0 to 19
3200 '  for j=0 to 11
3210 read buf_good_couple1(i)
3220 '  next j
3230 next i
3240 restore 4020
3250 for j=0 to 19
3260 read buf_good_couple2(j)
3270 next j
3280 '0.理解し合えるカップル ここまで
3290 '1.互いに自然体でつきあえる二人　ここから
3300 restore 4050
3310 for i=0 to 19
3320 read buf_natural_couple1(i)
3330 next i
3340 restore 4060
3350 for j=0 to 19
3360 read buf_natural_couple2(j)
3370 next j
3380 '1.互いに自然体でつきあえる二人　ここまで
3390 '2        ここから
3400 restore 4090
3410 for i=0 to 19
3420 read buf_good_for_man1(i)
3430 next i
3440 restore 4100
3450 for j=0 to 19
3460 read buf_good_for_man2(j)
3470 next j
3480 '2        ここまで
3490 '3        ここから
3500 restore 4130
3510 for i=0 to 19
3520 read buf_good_for_woman1(i)
3530 next i
3540 restore 4140
3550 for j=0 to 19
3560 read buf_good_for_woman2(j)
3570 next j
3580 '3        ここまで
3590 '4        ここから
3600 restore 4170
3610 for i=0 to 19
3620 read short_of_experience1(i)
3630 next i
3640 restore 4180
3650 for j=0 to 19
3660 read short_of_experience2(j)
3670 next j
3680 '4        ここまで
3690 '5.結婚への発展が困難なカップル  ここから
3700 restore 4210
3710 for i=0 to 19
3720 read buf_difficult_for_couple1(i)
3730 next i
3740 restore 4220
3750 for j=0 to 19
3760 read buf_difficult_for_couple2(j)
3770 next j
3780 '5.結婚への発展が困難なカップル  ここまで
3790 '6.愛し方にズレが出る二人 ここから
3800 restore 4250
3810 for i=0 to 19
3820 read buf_difference_of_love1(i)
3830 next i
3840 restore 4260
3850 for j=0 to 19
3860 read buf_difference_of_love2(j)
3870 next j
3880 '6.愛し方にズレが出る二人 ここまで
3890 '7.互いの価値観が噛み合わない相性 ここから
3900 restore 4290
3910 for i=0 to 19
3920 read buf_difference_of_KachiKan1(i)
3930 next i
3940 restore 4300
3950 for j=0 to 19
3960 read buf_difference_of_KachiKan2(j)
3970 next j
3980 '7.互いの価値観が噛み合わない相性 ここまで
3990 '相性占いタイプ ここから
4000 restore 4340
4010 for i=0 to 7
4020 read Result_Aisyou_type$(i)
4030 next i
4040 data 1,5,6,2,5,7,3,5,8,4,6,0,-1,-1,-1,-1,-1,-1,-1,-1
4050 data 8,2,2,6,8,4,9,0,1,7,1,5,-1,-1,-1,-1,-1,-1,-1,-1
4060 '0.理解し合えるカップル　ここまで
4070 '1.互いに自然体でつきあえるカップル ここから
4080 data 1,4,6,7,9,2,4,6,8,9,3,4,6,8,0,3,4,7,8,0
4090 data 6,1,6,2,6,5,4,7,7,0,2,9,8,8,3,3,0,1,0,7
4100 '1.互いに自然体でつきあえるカップル　ここまで
4110 '2.男性にとって居心地の良いカップル  ここから
4120 data 1,6,9,2,8,9,3,8,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
4130 data 1,5,4,0,5,8,4,9,9,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
4140 '2男性にとって居心地の良いカップル ここまで
4150 '3女性にとって居心地の良いカップル  ここから
4160 data 1,2,6,7,1,5,6,0,2,5,7,0,-1,-1,-1,-1,-1,-1,-1,-1
4170 data 3,2,4,0,9,3,9,2,1,6,8,8,-1,-1,-1,-1,-1,-1,-1,-1
4180 '3女性にとって居心地の良いカップル  ここまで
4190 '4恋愛経験を重ねた後なら愛を育める ここから
4200 data 1,3,6,8,1,3,7,2,4,8,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
4210 data 7,6,3,3,0,7,5,4,5,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
4220 '4恋愛経験を重ねた後なら愛を育める ここまで
4230 '5.結婚への発展が困難なカップル ここから
4240 data 1,4,7,2,4,9,3,7,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
4250 data 2,3,7,3,6,3,5,6,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
4260 '5.結婚への発展が困難なカップル ここまで
4270 '6.愛し方にズレが生じる二人  ここから
4280 data 1,5,9,2,5,9,3,7,0,3,8,-1,-1,-1,-1,-1,-1,-1,-1,-1
4290 data 5,4,5,7,7,7,8,9,6,0,6,-1,-1,-1,-1,-1,-1,-1,-1,-1
4300 '6.愛し方にずれが生じる二人  ここまで
4310 '7.互いに価値観が噛み合わない相性　ここから
4320 data 1,4,5,9,0,2,4,6,9,2,5,7,9,3,5,8,0,-1,-1,-1
4330 data 4,2,9,1,0,8,8,0,2,9,1,3,9,1,5,4,4,-1,-1,-1
4340 '7.互いに価値観が噛み合わない相性 ここまで
4350 '相性占い結果パターン ここから
4360 '0
4370 data "理解し合える最良のカップル"
4380 '1
4390 data "互いに自然体でつきあえるカップル"
4400 '2
4410 data "男性にとって居心地の良い相性"
4420 '3
4430 data "女性にとって居心地の良い相性"
4440 '4
4450 data "恋愛経験を重ねた後なら愛を育める"
4460 '5
4470 data "結婚への発展が困難なカップル"
4480 '6
4490 data "愛し方にずれが生じる二人"
4500 '7
4510 data "互いの価値観が噛み合わない相性"
4520 '相性占い結果パターン ここまで
4530 'メイン画面 Top画面1
4540 Main_Screen:
4550 cls 3:font 48:color rgb(255,255,255),,rgb(176,196,222)
4560 talk "番号を選んでエンターキーを押してください"
4570 'Text ,Grapgic clear:cls 3
4580 'グラフィック領域　ここから
4590 line (0,0)-(870,60),rgb(0,0,255),bf
4600 pen 5:line(0,0)-(867,57),rgb(255,255,255),b
4610 line (0,60)-(870,460),rgb(127,255,212),bf
4620 pen 5:line(0,63)-(873,462),rgb(0,0,0),b
4630 line (0,457)-(873,637),rgb(0,255,0),bf
4640 pen 5:line(0,463)-(874,640),rgb(255,0,255),b
4650 'グラフィック領域 ここまで
4660 'touch(0):x=touch(4)
4670 print"◎姓名判断　メイン画面"+chr$(13)
4680 '文字色:黒
4690 color rgb(255,0,255)
4700 print"1.姓名判断"+chr$(13)
4710 print"2.姓名判断の設定"+chr$(13)
4720 print"3.ヘルプ"+chr$(13)
4730 print"4.プログラムの終了"+chr$(13)
4740 'x=touch(4)
4750 'print"7.プログラム終了"+chr$(13)
4760 '文字:黒
4770 color rgb(0,0,0)
4780 print"番号を選んでください"+chr$(13)
4790 Input"番号:",selectNo
4800 if selectNo = 1 then goto SeimeiHandan_Top:
4810 if selectNo = 2 then goto Menu2_Setting:
4820 if selectNo = 3  then goto Menu2_Help:
4830 if selectNo = 4 then talk"終了します":cls 3:end
4840 if  selectNo > 4 or selectNo=0  then goto Main_Screen:
4850 if str$(selectNo)="" then goto Main_Screen:
4860 '1.姓名判断トップ画面
4870 screen 1,1
4880 'タイトル文字:白
4890 font 48:color rgb(255,255,255),,rgb(176,196,222)
4900 talk "姓名判断トップメニューです。姓名判断の種類の番号を選んでエンターキーを押してください"
4910 'グラフィック 描画領域　ここから
4920 SeimeiHandan_Top:
4930 cls 3
4940 '1.Title:青
4950 line (0,0)-(870,60),rgb(0,0,255),bf
4960 pen 5:line (0,3)-(873,63),rgb(255,255,255),b
4970 line (0,60)-(870,360),rgb(127,255,212),bf
4980 pen 5:LINE (0,63)-(873,363),rgb(255,0,255),b
4990 line (0,360)-(870,520),rgb(0,255,0),bf
5000 pen 5:line (0,363)-(873,523),rgb(0,0,0),b
5010 'グラフィック 描画領域 ここまで
5020 color rgb(255,255,255)
5030 print"◎姓名判断の種類トップメニュー"+chr$(13)
5040 color rgb(255,0,255):print"1.九星姓名判断"+chr$(13)
5050 color rgb(255,0,255):print"2.安斎流姓名判断"+chr$(13)
5060 COLOR rgb(255,0,255):print"3.前の画面に戻る"+chr$(13)
5070 color rgb(0,0,0):Print"番号を選んでエンターを押してください"
5080 color rgb(0,0,0):Input"番号:",selectNo
5090 IF selectNo=1 then goto Menu1_kyusei:
5100 if selectNo=2 then goto Menu1_2_Anzai_Top:
5110 if selectNo=3 then goto Main_Screen:
5120 '１．姓名判断(九星姓名判断トップ)
5130 'グラフィック領域　ここから
5140 Menu1_kyusei:
5150 cls 3
5160 line (0,0)-(720,60),rgb(0,0,250),bf
5170 pen 5:line (0,0)-(723,63),rgb(255,255,255),b
5180 line (0,60)-(720,450),rgb(127,255,212),bf
5190 pen 5:line(0,63)-(723,453),rgb(0,0,0),b
5200 line (0,450)-(720,650),rgb(0,255,0),bf
5210 pen 5:line(0,453)-(723,653),rgb(255,0,255),b
5220 'グラフィック領域　ここまで
5230 font 48:color rgb(255,255,255),,rgb(176,196,222)
5240 talk "姓名判断トップ画面です。番号を選んでエンターキーを押してください。"
5250 cls:color rgb(255,255,255):print"◎1.姓名判断(九星姓名判断)"+chr$(13)
5260 color rgb(255,0,255):print"1.人名の吉凶を見る"+chr$(13)
5270 color rgb(255,0,255):print"2.総数で名前の吉凶を見る"+chr$(13)
5280 color rgb(255,0,255):print"3.名前の陰陽を見る"+chr$(13)
5290 color rgb(255,0,255):print"4.前の画面に戻る"+chr$(13)
5300 color rgb(0,0,0):print"番号を選んでください"+chr$(13)
5310 color rgb(0,0,0):Input"番号:",selectNo
5320 if selectNo=1 then goto Menu1_name_Kikkyo:
5330 if selectNo=2 then goto Menu1_2_Total_name:
5340 if selectNo=3 then goto Input_name_InYo:
5350 if selectNo=4 then goto Main_Screen:
5360 if selectNo > 4 or selectNo=0 then goto Menu1_kyusei:
5370 '2.姓名判断 安斎流姓名判断　トップ画面
5380 '2-1名前の姓の部分を入力
5390 'グラフィック領域　ここから
5400 Menu2_Anzai_Kikkyo:
5410 cls 3:LINE (0,0)-(950,60),rgb(0,0,255),bf
5420 pen 5:line(0,0)-(953,63),rgb(255,255,255),b
5430 line (0,63)-(947,275),rgb(127,255,212),bf
5440 pen 5:line(0,63)-(950,278),rgb(0,255,0),b
5450 line (0,275)-(950,375),rgb(0,255,0),bf
5460 pen 5:line(0,272)-(947,372),rgb(0,0,0),b
5470 'グラフィック領域 ここまで
5480 color rgb(255,255,255):print"安斎流　姓名判断　トップメニュー"+chr$(13)
5490 talk"安斎流姓名判断トップメニューです,名前を2回に分けて入力してください。まず最初に名前の姓の部分を入れてください"
5500 COLOR rgb(255,0,255)
5510 print"名前を2回に分けて入力してください"+chr$(13)
5520 print"名前の姓の部分を入れてください"+chr$(13)
5530 color rgb(0,0,0)
5540 input"名前の姓:",bufname$
5550 buff1=len(bufname$)
5560 '2-2名前の名の部分を入力
5570 'グラフィック描画領域　ここから
5580 cls 3
5590 line (0,0)-(950,60),rgb(0,0,255),bf
5600 pen 5:line(0,0)-(950,60),rgb(255,255,255),b
5610 line (0,60)-(950,160),rgb(127,255,212),bf
5620 pen 5:line(0,63)-(953,163),rgb(255,0,255),b
5630 line (0,160)-(950,260),rgb(0,255,0),bf
5640 pen 5:line(0,163)-(953,263),rgb(0,0,0),b
5650 'グラフィック描画領域 ここまで
5660 COLOR rgb(255,255,255)
5670 cls:print"安斎流姓名判断トップメニュー"+chr$(13)
5680 talk"つぎに、名前のめいの部分を入れてください"
5690 color rgb(255,0,255)
5700 print"名前の名の部分を入れてください"+chr$(13)
5710 color rgb(0,0,0)
5720 input"名前の名:",bufname2$
5730 buff2=len(bufname2$)
5740 bufff=buff1+buff2
5750 'goto 15880
5760 select case bufff
5770 '姓1文字,名1文字
5780 case 2:
5790 cls
5800 '天運:buf_tenunn
5810 buf_tenunn=char_count(bufname$)
5820 '地運:buf_chiunn
5830 buf_chiunn=char_count(bufname2$)
5840 '人運 = 天運 + 地運
5850 buf_jinunn=buf_tenunn + buf_chiunn
5860 '外運 = 天運 + 人運
5870 buf_gaiunn = buf_tenunn + buf_chiunn
5880 '総数=buf_gaiunn
5890 buf_total=buf_gaiunn
5900 goto Menu2_Result_Anzai_Kikkyo:
5910 '姓１，名:2
5920 case 3:
5930 cls:
5940 if buff1=1 and buff2=2 then
5950 '1.天運:buf_tenunn
5960 buf_tenunn=char_count(bufname$)
5970 '2文字目の文字
5980 bufer_name2$(0)=Mid$(bufname2$,1,1)
5990 '3文字目の文字
6000 bufer_name2$(1)=Mid$(bufname2$,2,1)
6010 '2.人運
6020 buf_jinunn=char_count(bufer_name$(0))+char_count(bufer_name2$(1))
6030 '3.地運:buf_chiunn
6040 buf_chiunn=char_count(bufer_name2$(0))+char_count(bufer_name2$(1))
6050 '4外運:buf_gaiunn
6060 buf_gaiunn=char_count(bufer_name$(0))+char_count(bufer_name2$(1))
6070 '5.総数:buf_total
6080 buf_total=char_count(bufer_name$(0))+char_count(bufer_name2$(0))+char_count(bufer_name2$(1))
6090 goto Menu2_Result_Anzai_Kikkyo:
6100 endif
6110 if buff1=2 and buff2=1 then
6120 bufer_name$(0)=Mid$(bufname$,1,1)
6130 bufer_name$(1)=Mid$(bufname$,2,1)
6140 bufer_name2$(0)=Mid$(bufname$,1,1)
6150 '1.天運
6160 buf_tenunn=char_count(bufer_name$(0))+char_count(bufer_name$(1))
6170 '2.人運
6180 buf_jinunn=char_count(bufer_name$(1))+char_count(bufer_name2$(0))
6190 '3.地運
6200 buf_chiunn=char_count(bufer_name2$(0))
6210 '4.外運
6220 buf_gaiunn=char_count(bufer_name$(0))+char_count(bufer_name2$(0))
6230 '5.総数
6240 buf_total=char_count(bufer_name$(0))+char_count(bufer_name$(1))+char_count(bufer_name2$(0))
6250 goto Menu2_Result_Anzai_Kikkyo:
6260 endif
6270 case 4:
6280 if buff1=2 and buff2=2 then
6290 bufer_name$(0)=Mid$(bufname$,1,1)
6300 bufer_name$(1)=Mid$(bufname$,2,1)
6310 bufer_name2$(0)=Mid$(bufname2$,1,1)
6320 bufer_name2$(1)=Mid$(bufname2$,2,1)
6330 '1.天運
6340 buf_tenunn = char_count(bufer_name$(0)) + char_count(bufer_name$(1))
6350 '2.人運
6360 buf_jinunn=char_count(bufer_name$(1))+char_count(bufer_name2$(0))
6370 '3.地運
6380 buf_chiunn=char_count(bufer_name2$(0))+char_count(bufer_name2$(1))
6390 '4.外運
6400 buf_gaiunn=char_count(bufer_name$(0))+char_count(bufer_name2$(1))
6410 '5.総数
6420 buf_total=char_count(bufer_name$(0))+char_count(bufer_name$(1))+char_count(bufer_name2$(0))+char_count(bufer_name2$(1))
6430 goto Menu2_Result_Anzai_Kikkyo:
6440 endif
6450 'パターン2 姓3文字 名1文字 total4文字
6460 if buff1=3 and buff2=1 then
6470 bufer_name$(0)=Mid$(bufname$,1,1)
6480 bufer_name$(1)=Mid$(bufname$,2,1)
6490 bufer_name$(2)=Mid$(bufname$,3,1)
6500 bufer_name2$(0)=Mid$(bufname2$,1,1)
6510 '1.天運
6520 buf_tenunn = char_count(bufer_name$(0)) + char_count(bufer_name$(1)) + char_count(bufer_name$(2))
6530 '2.人運
6540 buf_jinunn = char_count(bufer_name$(2))+char_count(bufer_name2$(0))
6550 '3.地運
6560 buf_chiunn=char_count(bufer_name2$(0))
6570 '4.外運
6580 buf_gaiunn = char_count(bufer_name$(0)) + char_count(bufer_name$(1)) + char_count(bufname2$)
6590 '5.総運
6600 buf_total=char_count(bufer_name$(0))+char_count(bufer_name$(1))+char_count(bufer_name$(2))+char_count(bufer_name2$(0))
6610 goto Menu2_Result_Anzai_Kikkyo:
6620 endif
6630 'パターン３ 姓1,名３  合計４文字
6640 if buff1=1 and buff2=3 then
6650 bufer_name$(0)=Mid$(bufname$,1,1)
6660 bufer_name2$(0)=Mid$(bufname2$,1,1)
6670 bufer_name2$(1)=Mid$(bufname2$,2,1)
6680 bufer_name2$(2)=Mid$(bufname2$,3,1)
6690 '1.天運
6700 buf_tenunn = char_count(bufer_name$(0))
6710 '2.人運
6720 buf_jinunn=char_count(bufer_name$(0))+char_count(bufer_name2$(0))
6730 '3.地運
6740 buf_chiunn=char_count(bufer_name2$(0))+char_count(bufer_name2$(1))+char_count(bufer_name2$(2))
6750 '4.外運
6760 buf_gaiunn=char_count(bufer_name$(0))+char_count(bufer_name2$(1))+char_count(bufer_name2$(2))
6770 '5.総運
6780 buf_total=char_count(bufer_name$(0))+char_count(bufer_name2$(0))+char_count(bufer_name2$(1))+char_count(bufer_name2$(2))
6790 goto Menu2_Result_Anzai_Kikkyo:
6800 endif
6810 case 5:
6820 '５文字の名前
6830 '1.  3文字姓 2字名
6840 if buff1=3 and buff2=2 then
6850 bufer_name$(0)=Mid$(bufname$,1,1)
6860 bufer_name$(1)=Mid$(bufname$,2,1)
6870 bufer_name$(2)=Mid$(bufname$,3,1)
6880 bufer_name2$(0)=Mid$(bufname2$,1,1)
6890 bufer_name2$(1)=Mid$(bufname2$,2,1)
6900 '1.天運
6910 buf_tenunn=char_count(bufer_name$(0))+char_count(bufer_name$(1))+char_count(bufer_name$(2))
6920 '2.人運
6930 buf_jinunn=char_count(bufer_name$(2))+char_count(bufer_name2$(0))
6940 '3.地運
6950 buf_chiunn=char_count(bufer_name2$(0))+char_count(bufer_name2$(1))
6960 '4.外運
6970 buf_gaiunn=char_count(bufer_name$(0))+char_count(bufer_name$(1))+char_count(bufer_name2$(1))
6980 '5.総運
6990 buf_total=char_count(bufer_name$(0))+char_count(bufer_name$(1))+char_count(bufer_name$(2))+char_count(bufer_name2$(0))+char_count(bufer_name2$(1))
7000 goto Menu2_Result_Anzai_Kikkyo:
7010 endif
7020 if buff1=2 and buff2=3 then
7030 bufer_name$(0)=Mid$(bufname$,1,1)
7040 bufer_name$(1)=Mid$(bufname$,2,1)
7050 bufer_name2$(0)=Mid$(bufname2$,1,1)
7060 bufer_name2$(1)=Mid$(bufname2$,2,1)
7070 bufer_name2$(2)=Mid$(bufname2$,3,1)
7080 '1.天運
7090 buf_tenunn=char_count(bufer_name$(0))+char_count(bufer_name$(1))
7100 '2.人運
7110 buf_jinunn=char_count(bufer_name$(1))+char_count(bufer_name2$(0))
7120 '3.地運
7130 buf_chiunn=char_count(bufer_name2$(0))+char_count(bufer_name2$(1))+char_count(bufer_name2$(2))
7140 '4.外運
7150 buf_gaiunn=char_count(bufer_name$(0))+char_count(bufer_name2$(1))+char_count(bufer_name2$(2))
7160 '5.総運
7170 buf_total=char_count(bufer_name$(0))+char_count(bufer_name$(1))+char_count(bufer_name2$(0))+char_count(bufer_name2$(1))+char_count(bufer_name2$(2))
7180 goto Menu2_Result_Anzai_Kikkyo:
7190 endif
7200 if buff1=4 and buff2=1 then
7210 bufer_name$(0)=Mid$(bufname$,1,1)
7220 bufer_name$(1)=mid$(bufname$,2,1)
7230 bufer_name$(2)=mid$(bufname$,3,1)
7240 bufer_name$(3)=mid$(bufname$,4,1)
7250 bufer_name2$(0)=mid$(bufname2$,1,1)
7260 '1.天運
7270 buf_tenunn=char_count(bufer_name$(0))+char_count(bufer_name$(1))+char_count(bufer_name$(2))+char_count(bufer_name$(3))
7280 '2.人運
7290 buf_jinunn=char_count(bufer_name$(3))+char_count(bufer_name2$(0))
7300 '3.地運
7310 buf_chiunn=char_count(bufer_name2$(0))
7320 '4.外運
7330 buf_gaiunn=char_count(bufer_name$(0))+char_count(bufer_name$(1))+char_count(bufer_name2$(0))
7340 '5.総運
7350 buf_total=char_count(bufer_name$(0))+char_count(bufer_name$(1))+char_count(bufer_name$(2))+char_count(bufer_name$(3))+char_count(bufer_name2$(0))
7360 goto Menu2_Result_Anzai_Kikkyo:
7370 endif
7380 case 6:
7390 '3字姓 3字名
7400 if buff1=3 and buff2=3 then
7410 bufer_name$(0)=Mid$(bufname$,1,1)
7420 bufer_name$(1)=Mid$(bufname$,2,1)
7430 bufer_name$(2)=Mid$(bufname$,3,1)
7440 bufer_name2$(0)=Mid$(bufname2$,1,1)
7450 bufer_name2$(1)=Mid$(bufname2$,2,1)
7460 bufer_name2$(2)=Mid$(bufname2$,3,1)
7470 '1.天運
7480 buf_tenunn=char_count(bufer_name$(0))+char_count(bufer_name$(1))+char_count(bufer_name$(2))
7490 '2.人運
7500 buf_jinunn=char_count(bufer_name$(2))+char_count(bufer_name2$(0))
7510 '3.地運
7520 buf_chiunn=char_count(bufer_name2$(0))+char_count(bufer_name2$(1))+char_count(bufer_name2$(2))
7530 '4.外運
7540 buf_gaiunn=char_count(bufer_name$(0))+char_count(bufer_name$(1))+char_count(bufer_name2$(1))+char_count(bufer_name2$(2))
7550 '5.総運
7560 buf_total=char_count(bufer_name$(0))+char_count(bufer_name$(1))+char_count(bufer_name$(2))+char_count(bufer_name2$(0))+char_count(bufer_name2$(1))+char_count(bufer_name2$(2))
7570 goto Menu2_Result_Anzai_Kikkyo:
7580 endif
7590 '4字姓 2字名
7600 if buff1=4 and buff2=2 then
7610 bufer_name$(0)=Mid$(bufname$,1,1)
7620 bufer_name$(1)=Mid$(bufname$,2,1)
7630 bufer_name$(2)=Mid$(bufname$,3,1)
7640 bufer_name$(3)=Mid$(bufname$,4,1)
7650 bufer_name2$(0)=Mid$(bufname2$,1,1)
7660 bufer_name2$(1)=Mid$(bufname2$,2,1)
7670 '1.天運
7680 buf_tenunn=char_count(bufer_name$(0))+char_count(bufer_name$(1))+char_count(bufer_name$(2))+char_count(bufer_name$(3))
7690 '2.人運
7700 buf_jinunn=char_count(bufer_name$(3))+char_count(bufer_name2$(0))
7710 '3.地運
7720 buf_chiunn=char_count(bufer_name2$(0))+char_count(bufer_name2$(1))
7730 '4.外運
7740 buf_gaiunn=char_count(bufer_name$(0))+char_count(bufer_name$(1))+char_count(bufer_name2$(1))
7750 '5.総運
7760 buf_total=char_count(bufer_name$(0))+char_count(bufer_name$(1))+char_count(bufer_name$(2))+char_count(bufer_name$(3))+char_count(bufer_name2$(0))+char_count(bufer_name2$(1))
7770 goto Menu2_Result_Anzai_Kikkyo:
7780 endif
7790 '4字姓 3字名
7800 case 7:
7810 if buff1=4 and buff2=3 then
7820 bufer_name$(0)=Mid$(bufname$,1,1)
7830 bufer_name$(1)=Mid$(bufname$,2,1)
7840 bufer_name$(2)=Mid$(bufname$,3,1)
7850 bufer_name$(3)=Mid$(bufname$,4,1)
7860 bufer_name2$(0)=Mid$(bufname2$,1,1)
7870 bufer_name2$(1)=Mid$(bufname2$,2,1)
7880 bufer_name2$(2)=Mid$(bufname2$,3,1)
7890 '1.天運
7900 buf_tenunn=char_count(bufer_name$(0))+char_count(bufer_name$(1))+char_count(bufer_name$(2))+char_count(bufer_name$(3))
7910 '2.人運
7920 buf_jinunn=char_count(bufer_name$(3))+char_count(bufer_name2$(0))
7930 ' 3.地運
7940 buf_chiunn=char_count(bufer_name2$(0))+char_count(bufer_name2$(1))+char_count(bufer_name2$(2))+char_count(bufer_name2$(3))
7950 '4.外運
7960 buf_gaiunn=char_count(bufer_name$(0))+char_count(bufer_name$(1))+char_count(bufer_name2$(1))+char_count(bufer_name2$(2))
7970 '5.総運
7980 buf_total=char_count(bufer_name$(0))+char_count(bufer_name$(1))+char_count(bufer_name$(2))+char_count(bufer_name$(3))+char_count(bufer_name2$(0))+char_count(bufer_name2$(1))+char_count(bufer_name2$(2))
7990 goto Menu2_Result_Anzai_Kikkyo:
8000 endif
8010 case else:
8020 end select
8030 '2.設定
8040 Menu2_Setting:
8050 font 48:color rgb(0,0,0),,rgb(176,196,222)
8060 talk"設定画面です。番号を選んでエンターキーを押してください"
8070 'グラフィック領域　ここから
8080 cls 3:
8090 line (0,0)-(700,60),rgb(0,0,255),bf
8100 pen 5:line(0,0)-(703,63),rgb(255,255,255),b
8110 line (0,60)-(700,570),rgb(127,255,212),bf
8120 pen 5:line(0,66)-(703,576),rgb(255,0,255),b
8130 line (0,570)-(700,740),rgb(0,255,0),bf
8140 pen 5:line(0,576)-(703,746),rgb(0,0,0),b
8150 'グラフィック領域 ここまで
8160 '1行目　文字色　 白
8170 color rgb(255,255,255):print"姓名判断　設定画面トップ画面"+chr$(13)
8180 color rgb(255,0,255):print"1.登録文字の確認"+chr$(13)
8190 color rgb(255,0,255):print"2.登録文字数の表示"+chr$(13)
8200 color rgb(255,0,255):print"3.メンバーリストの表示"+chr$(13)
8210 color rgb(255,0,255):print"4.前の画面に戻る"+chr$(13)
8220 color rgb(255,0,255):PRINT"5.プログラムの終了"+chr$(13)
8230 color rgb(0,0,0)
8240 print"番号を選んでください"+chr$(13)
8250 Input"番号:",selectNo、
8260 if selectNo=1 then font 48:goto Menu2_moji_check:
8270 if selectNo=2 then font 48:goto Menu2_Entry_moji:
8280 if selectNo=3 then font 48:goto Member_List_Top:
8290 if selectNo=4 then font 48:goto Main_Screen:
8300 if selectNo=5 then talk"終了します":cls 3:font 48:end
8310 if selectNo > 5 or selectNo = 0 then goto Menu2_Setting:
8320 '3 番号で吉凶を見る 入力
8330 Menu1_2_Total_name:
8340 font 48:color rgb(0,0,0),,rgb(176,196,222)
8350 'グラフィック描画領域　ここから
8360 cls 3
8370 line (0,0)-(700,60),rgb(0,0,255),bf
8380 pen 5:line (0,0)-(703,63),rgb(255,255,255),b
8390 line (0,60)-(700,250),rgb(127,255,212),bf
8400 pen 5:line(0,63)-(703,253),rgb(255,0,255),b
8410 line (0,247)-(697,357),rgb(0,255,0),bf
8420 pen 5:line(0,263)-(703,363),rgb(0,0,0),b
8430 'グラフィック描画領域 ここまで
8440 color rgb(255,255,255)
8450 print"画数での吉凶判定"+chr$(13)
8460 color rgb(255,0,255)
8470 print"画数を入れてください"+chr$(13)
8480 print"(Max:81文字)"+chr$(13)
8490 color rgb(0,0,0)
8500 Input"文字の画数:",Number
8510 if Number > 81 then goto Menu1_2_Total_name:
8520 if Number <=81 then goto Result_Total_name:
8530 '3.番号で吉凶を見る 結果表示
8540 'グラフィック描画領域　ここから
8550 Result_Total_name:
8560 cls 3
8570 line (0,0)-(700,60),rgb(0,0,255),bf
8580 pen 5:line(0,0)-(703,63),rgb(255,255,255),b
8590 line (0,60)-(700,253),rgb(127,255,212),bf
8600 pen 5:line(0,63)-(703,256),rgb(255,0,255),b
8610 line (0,253)-(700,357),rgb(0,255,0),bf
8620 pen 5:line(0,250)-(703,360),rgb(0,0,0),b
8630 'グラフィック描画領域　ここまで
8640 color rgb(255,255,255)
8650 print "画数で吉凶を求める"+chr$(13)
8660 color rgb(255,0,255)
8670 talk str$(Number-1)+"画のきっきょうは、"+buf_Kikkyo$(Number-1)+"です"
8680 print"画数:";Number;chr$(13):print"吉凶:";buf_Kikkyo$(Number-1);chr$(13)
8690 'endif
8700 color rgb(0,0,0)
8710 print "エンターキーを押してください"+chr$(13)
8720 key$=input$(1)
8730 If key$=chr$(13) then goto Menu1_kyusei:
8740 '3.ヘルプ
8750 Menu2_Help:
8760 cls 3:font 48:color rgb(0,0,0),,rgb(176,196,222)
8770 '描画領域 ここから
8780 line (0,0)-(650,60),rgb(0,0,255),bf
8790 pen 5:line(0,0)-(653,63),rgb(255,255,255),b
8800 line (0,60)-(650,560),rgb(127,255,212),bf
8810 pen 5:line(0,63)-(653,563),rgb(255,0,255),b
8820 line (0,560)-(650,660),rgb(0,255,0),bf
8830 pen 5:line(0,563)-(653,663),rgb(0,0,0),b
8840 '描画領域　ここまで
8850 talk"ヘルプ画面です番号を選んでエンターキーを押してください"
8860 color rgb(255,255,255):print "姓名判断　ヘルプ"+chr$(13)
8870 color rgb(255,0,255):print"1.バージョン情報"+chr$(13)
8880 color rgb(255,0,255):print"2.参考文献"+chr$(13)
8890 color rgb(255,0,255):print"3.プログラムの終了"+chr$(13)
8900 color rgb(255,0,255):print"4.メンバーリストの削除"+chr$(13)
8910 color rgb(255,0,255):PRINT"5.前の画面に戻る"+chr$(13)
8920 color rgb(0,0,0):Input"番号:",selectNo
8930 if selectNo=1 then goto Version_Info:
8940 if selectNo=2 then goto Reference_book:
8950 if selectNo=3 then talk"終了いたします":cls 3:end
8960 if selectNo=4 then goto Remove_MemberList:
8970 if selectNo=5 then goto Main_Screen:
8980 if selectNo > 5 or selectNo = 0 then goto 8730
8990 Menu1_name_Kikkyo:
9000 'Menu1　画面
9010 talk"調べたい名前のみよじをいれてください"
9020 'グラフィック描画領域　ここから
9030 cls 3
9040 line (0,0)-(1000,60),rgb(0,0,255),bf
9050 pen 5:line(0,0)-(1003,63),rgb(255,255,255),b
9060 line (0,60)-(1000,170),rgb(127,255,212),bf
9070 pen 5:line(0,63)-(1003,173),rgb(255,0,255),b
9080 line (0,170)-(1000,300),rgb(0,255,0),bf
9090 pen 5:line(0,173)-(1003,303),rgb(0,0,0),b
9100 'グラフィック描画領域　ここまで
9110 color rgb(255,255,255):print"調べたい名前の苗字を入れてください"+chr$(13)
9120 color rgb(255,0,255):print"例:山田太郎の山田の部分"+chr$(13)
9130 color rgb(0,0,0):input"調べたい名前の苗字(上の文字):",name$
9140 cls
9150 talk "調べたい名前の下の名を入れてください":color rgb(255,255,255):print"調べたい名前の名の部分を入れてください"+chr$(13)
9160 color rgb(255,0,255):print"例:山田太郎の太郎の部分を入れてください"+chr$(13)
9170 color rgb(0,0,0):input"調べたい名前の名の部分(下の部分):",name2$
9180 goto 9400
9190 'メニュー6　バージョン表示
9200 'グラフィック　描画　領域　 ここから
9210 Version_Info:
9220 cls 3
9230 line (0,0)-(1050,60),rgb(0,0,255),bf
9240 pen 5:line(0,0)-(1053,63),rgb(255,255,255),b
9250 line (0,60)-(1050,630),rgb(127,255,212),bf
9260 pen 5:line(0,0)-(1053,633),rgb(0,255,0),b
9270 line (0,630)-(1050,750),rgb(0,255,0),bf
9280 pen 5:line(0,633)-(1053,753),rgb(0,0,0),b
9290 'グラフィック　描画 領域　 ここまで
9300 color rgb(255,255,255):print"バージョン情報"+chr$(13)
9310 color rgb(255,0,255):print"姓名判断"+chr$(13)
9320 color rgb(255,0,255):PRINT"Ver:235_02.20200715"+chr$(13)
9330 color rgb(255,0,255):print"対応文字:漢字、ひらがな、カタカナ、数字"+chr$(13)
9340 color rgb(255,0,255):print"アルファベット（大文字、小文字)"+chr$(13)
9350 color rgb(255,0,255):print"対応漢字画数：1画から24画まで"+chr$(13)
9360 color rgb(255,0,2550):print"制作開始:since 2019.04.07"+chr$(13)
9370 'ここを書き換える
9380 talk "このプログラムは、姓名判断バージョン2.35です"
9390 color rgb(0,0,0):print"エンターキーを押してください"+chr$(13)
9400 key$=INPUT$(1)
9410 if key$=chr$(13) then goto Main_Screen:
9420 '文字数を求める変数
9430 buf_char_size=len(name$)
9440 buf_char_size2=len(name2$)
9450 '入力した文字を代入する変数
9460 '入力した文字を配列に代入する処理
9470 '姓名判断データー文字比較
9480 '画数を求める関数
9490 func char_count(buf_count$)
9500 count=0:buffer=0
9510 '1画の文字 23文字
9520 for j=0 to ((Moji_1)-1)
9530 if buf_count$=buf_char_hiragana1$(j) then
9540 count =1:
9550 endif
9560 next j
9570 '2画の文字
9580 for j=0 to ((Moji_2)-1)
9590 if buf_count$=buf_char_hiragana2$(j)  then
9600 count = 2:
9610 endif
9620 next j
9630 for j=0 to ((Moji_3)-1)
9640 if buf_count$=buf_char_hiragana3$(j) then
9650 count =3:
9660 endif
9670 next j
9680 for j=0 to ((Moji_4)-1)
9690 if buf_count$=buf_char_hiragana4$(j) then
9700 count = 4:
9710 endif
9720 next j
9730 for j=0 to ((Moji_5)-1)
9740 if buf_count$=buf_char_hiragana5$(j) then
9750 count = 5:
9760 endif
9770 next j
9780 for j=0 to ((Moji_6)-1)
9790 if buf_count$=buf_char_hiragana6$(j) then
9800 count= 6
9810 endif
9820 next j
9830 for  j=0 to ((Moji_7)-1)
9840 if buf_count$=buf_char_hiragana7$(j) then
9850 count=  7
9860 endif
9870 next j
9880 for j=0 to ((Moji_8)-1)
9890 if buf_count$=buf_char_hiragana8$(j) then
9900 count= 8
9910 endif
9920 next j
9930 for j=0 to ((Moji_9)-1)
9940 if buf_count$=buf_char_hiragana9$(j) then
9950 count=9
9960 endif
9970 next j
9980 for j=0 to ((Moji_10)-1)
9990 if buf_count$=buf_char_hiragana10$(j) then
10000 count=10
10010 endif
10020 next j
10030 for j=0 to ((Moji_11)-1)
10040 if buf_count$=buf_char_hiragana11$(j) then
10050 count=11
10060 endif
10070 next j
10080 for j=0 to  ((Moji_12)-1)
10090 if buf_count$=buf_char_hiragana12$(j) then
10100 count=12
10110 endif
10120 next j
10130 for j=0 to ((Moji_13)-1)
10140 if buf_count$=buf_char_hiragana13$(j) then
10150 count=13
10160 endif
10170 next j
10180 for j=0 to ((Moji_14)-1)
10190 if buf_count$=buf_char_hiragana14$(j) then
10200 count=14
10210 endif
10220 next j
10230 for j=0 to ((Moji_15)-1)
10240 if buf_count$=buf_char_hiragana15$(j) then
10250 count=15
10260 endif
10270 next j
10280 for j=0 to ((Moji_16)-1)
10290 if buf_count$=buf_char_hiragana16$(j) then
10300 count=16
10310 endif
10320 next j
10330 for j=0 to ((Moji_17)-1)
10340 if buf_count$=buf_char_hiragana17$(j) then
10350 count=17
10360 endif
10370 next j
10380 for j=0 to ((Moji_18)-1)
10390 if buf_count$=buf_char_hiragana18$(j) then
10400 count=18
10410 endif
10420 next j
10430 for j=0 to ((Moji_19)-1)
10440 if buf_count$=buf_char_hiragana19$(j) then
10450 count=19
10460 endif
10470 next j
10480 for j=0 to ((Moji_20)-1)
10490 if buf_count$=buf_char_hiragana20$(j) then
10500 count=20
10510 endif
10520 next i
10530 for j=0 to ((Moji_21)-1)
10540 if buf_count$=buf_char_hiragana21$(j) then
10550 count=21
10560 endif
10570 next j
10580 for j=0 to ((Moji_22)-1)
10590 if buf_count$=buf_char_hiragana22$(j) then
10600 count=22
10610 endif
10620 next j
10630 for j=0 to ((Moji_23)-1)
10640 if buf_count$=buf_char_hiragana23$(j) then
10650 count=23
10660 endif
10670 next j
10680 for j=0 to ((Moji_24)-1)
10690 if buf_count$=buf_char_hiragana24$(j) then
10700 count=24
10710 endif
10720 buffer = count
10730 next j
10740 endfunc buffer
10750 '合計を求める関数
10760 func totalcounts(buffers$)
10770 buffers=0:
10780 for i=0 to len(buffers$)-1
10790 buffers=buffers+char_count(buffers$)
10800 next i
10810 endfunc buffers
10820 buf_count2=0:buf_count3=0
10830 'dim buf_Input_data$(len(name$))
10840 '1.苗字の文字数
10850 for n=0 to (buf_char_size-1)
10860 buf_Input_data$(n)=mid$(name$,n+1,1)
10870 next n
10880 for i=0 to (buf_char_size-1)
10890 buf_count2 = buf_count2 + char_count(buf_Input_data$(i))
10900 next i
10910 '2.名の文字数
10920 for n2=0 to (buf_char_size2-1)
10930 buf_Input_data2$(n2)=mid$(name2$,n2+1,1)
10940 next n2
10950 for i2=0 to (buf_char_size2-1)
10960 buf_count3 = buf_coun3 + char_count(buf_Input_data2$(i2))
10970 next i2
10980 '総数を出す
10990 select case (buf_char_size+buf_char_size2)
11000 case 5:
11010 if ((buf_char_size=2) and (buf_char_size2=3)) then
11020 buf_total=char_count(buf_Input_data$(0))+char_count(buf_Input_data$(1))+char_count(buf_Input_data2$(0))+char_count(buf_Input_data2$(1))+char_count(buf_Input_data2$(2))
11030 endif
11040 if ((buf_char_size=3) and (buf_char_size2=2)) then
11050 buf_total=char_count(buf_Input_data$(0))+char_count(buf_Input_data$(1))+char_count(buf_Input_data$(2))+char_count(buf_Input_data2$(0))+char_count(buf_Input_data2$(1))
11060 endif
11070 case 4:
11080 if ((char_count(buf_Input_data$(0))=0) or (char_count(buf_Input_data$(1))=0) or ((char_count(buf_Input_data2$(0))=0) or char_count(buf_Input_data2$(1))=0)) then
11090 color rgb(255,0,255)
11100 cls:print name$+name2$;"は、登録されていない文字があります"+chr$(13)
11110 color rgb(0,0,0)
11120 Input"エンターキーを押してください",key$
11130 if (key$="") then goto 4520
11140 else
11150 buf_total = char_count(buf_Input_data$(0))+char_count(buf_Input_data$(1))+char_count(buf_Input_data2$(0))+char_count(buf_Input_data2$(1))
11160 endif
11170 case 3:
11180 if ((buf_char_size = 1) and (buf_char_size2 = 2)) then
11190 buf_total = char_count(buf_Input_data$(0))+char_count(buf_Input_data2$(0))+char_count(buf_Input_data2$(1))
11200 endif
11210 if ((buf_char_size=2) and (buf_char_size2=1)) then
11220 buf_total=char_count(buf_Input_data$(0))+char_count(buf_Input_data$(1))+char_count(buf_Input_data2$(0))
11230 endif
11240 case 2:
11250 buf_total = char_count(buf_Input_data$(0)) + char_count(buf_Input_data2$(0))
11260 case else:
11270 end select
11280 '文字の総数をだす
11290 total_name$=name$+name2$
11300 '1.姓星を求める
11310 select case buf_char_size
11320 '苗字1文字のとき
11330 case 1:
11340 buf_seisei=char_count(buf_Input_data$(0)) + 1
11350 '苗字2文字の時
11360 case 2:
11370 for i = 0 to 1
11380 buf_seisei = buf_seisei+char_count(buf_Input_data$(i))
11390 next i
11400 '苗字3文字のとき
11410 case 3:
11420 buf_seisei = char_count(buf_Input_data$(0)) + char_count(buf_Input_data$(1) + buf_Input_data$(2))
11430 case else:
11440 end select
11450 '2.主星をだす
11460 '2.主星
11470 select case (buf_char_size + buf_char_size2)
11480 '姓名4文字のとき
11490 case 4:
11500 if ((buf_char_size = 2) and (buf_char_size2 = 2)) then
11510 buf_syusei = char_count(buf_Input_data$(1)) + char_count(buf_Input_data2$(0))
11520 endif
11530 '姓名3文字のとき
11540 case 3:
11550 if ((buf_char_size = 1) and (buf_charsize2 = 2)) then
11560 buf_syusei = char_count(buf_Input_data$(1)) + char_count(buf_Input_data2$(0))
11570 else
11580 buf_syusei = char_count(buf_Input_data$(1)) + char_count(buf_Input_data2$(0))
11590 endif
11600 case 2:
11610 buf_syusei = char_count(buf_Input_data$(1)) + char_count(buf_Input_data2$(0))
11620 case else:
11630 end select
11640 '3.名星を求める
11650 select case (buf_char_size + buf_char_size2)
11660 case 4:
11670 buf_meisei = char_count(buf_Input_data2$(0)) + char_count(buf_Input_data2$(1))
11680 case 3:
11690 if ((buf_char_size = 1) and (buf_char_size2 = 2)) then
11700 buf_meisei=char_count(buf_Input_data2$(0)+buf_Input_data2$(1))
11710 endif
11720 if ((buf_char_size=2) and (buf_char_size2=1)) then
11730 buf_meisei=char_count(buf_Input_data2$(0))+1
11740 endif
11750 case 2:
11760 buf_meisei=char_count(buf_Input_data2$(0))+1
11770 case else:
11780 end select
11790 '4.外星を求める
11800 select case (buf_char_size+buf_char_size2)
11810 case 4:
11820 buf_gaisei=char_count(buf_Input_data$(0))+char_count(buf_Input_data2$(1))
11830 case 3:
11840 if ((buf_char_size=1) and (buf_char_size2=2)) then
11850 buf_gaisei=1+char_count(buf_Input_data2$(1))
11860 endif
11870 if ((buf_char_size=2) and (buf_char_size2=1)) then
11880 buf_gaisei=char_count(buf_Input_data$(0))+1
11890 endif
11900 case 2:
11910 buf_gaisei=2
11920 case else:
11930 end select
11940 '診断結果表示
11950 '1.姓星を出す
11960 'グラフィック描画領域　ここから
11970 Menu1_Result_Kyusei:
11980 cls 3:
11990 '縦の画面
12000 line (0,0)-(950,60),rgb(0,0,255),bf
12010 pen 5:line (0,0)-(953,63),rgb(255,255,255),b
12020 line (0,60)-(950,650),rgb(127,255,212),bf
12030 pen 5: line (0,63)-(953,653),rgb(0,255,0),b
12040 line (0,650)-(950,770),rgb(0,255,0),bf
12050 pen 5: line (0,653)-(953,773),rgb(0,0,0),b
12060 '横の画面　吉凶のランク表
12070 'グラフィック描画領域　ここまで
12080 talk"診断結果です"
12090 color rgb(255,255,255):print "九星姓名判断　吉凶の結果表示"+chr$(13)
12100 color Rgb(255,0,255)
12110 print total_name$;"の姓星:";buf_seisei;"吉凶:";buf_Kikkyo$(buf_seisei-1)+chr$(13)
12120 '2.主星を出す
12130 print total_name$;"の主星:";buf_syusei;"吉凶:";buf_Kikkyo$(buf_syusei-1)+chr$(13)
12140 '3.名星を求める
12150 print total_name$;"の名星:";buf_meisei;"吉凶:";buf_Kikkyo$(buf_meisei-1)+chr$(13)
12160 '4.外星を求める
12170 print total_name$;"の外星:";buf_gaisei;"吉凶:";buf_Kikkyo$(buf_gaisei-1)+chr$(13)
12180 '5.総数を出す
12190 print total_name$;"の総数:";buf_total;"です"+chr$(13)
12200 print total_name$;"の文字の総合的な吉凶:";buf_Kikkyo$(buf_total-1)+chr$(13)
12210 color rgb(0,0,0)
12220 print "エンターキーを押してください"+chr$(13)
12230 key$=input$(1)
12240 if key$=chr$(13) then bufferCount=0:buf_count2=0:count=0:buffer=0:buf_seisei=0:buf_syusei=0:buf_meisei=0:buf_gaisei=0:goto Main_Screen:
12250 '2.主星を出す
12260 'メニュー3 登録文字の確認 ここから
12270 'グラフィック領域　ここから
12280 'タイトル青 文字:白
12290 Menu2_moji_check:
12300 cls 3:line (0,0)-(1100,60),rgb(0,0,255),bf
12310 pen 5:line(0,0)-(1097,57),rgb(255,255,255),b
12320 line (0,57)-(1100,180),rgb(0,255,255),bf
12330 pen 5:line(0,63)-(1103,183),rgb(0,0,255),b
12340 line (0,180)-(1100,300),rgb(0,255,0),bf
12350 pen 5:line(0,183)-(1103,303),rgb(0,0,0),b
12360 'グラフィック領域　ここまで
12370 '文字:白
12380 color rgb(255,255,255):print"登録文字の確認"+chr$(13)
12390 '文字:アクア
12400 color rgb(255,0,0):print"文字を入力してエンターキーを押してください"+chr$(13)
12410 color rgb(0,0,0):Input"登録文字を入れてください(1文字):",name$
12420 if (len(name$)>1) then ui_msg("１文字で入れてください"):goto Menu2_moji_check:
12430 '1画の文字
12440 for i=0 to ((Moji_1)-1)
12450 if (name$=buf_char_hiragana1$(i)) then
12460 buffer_count=1:goto Result_moji_check:
12470 endif
12480 next i
12490 '2画の文字
12500 for i=0 to ((Moji_2)-1)
12510 if (name$=buf_char_hiragana2$(i)) then
12520 buffer_count=2:goto Result_moji_check:
12530 endif
12540 next i
12550 '3画の文字
12560 for i=0 to ((Moji_3)-1)
12570 if (name$=buf_char_hiragana3$(i)) then
12580 buffer_count=3:goto Result_moji_check:
12590 endif
12600 next i
12610 '4画の文字
12620 for i=0 to ((Moji_4)-1)
12630 if (name$=buf_char_hiragana4$(i)) then
12640 buffer_count=4:goto Result_moji_check:
12650 endif
12660 next i
12670 '5画の文字
12680 for i=0 to ((Moji_5)-1)
12690 if (name$=buf_char_hiragana5$(i)) then
12700 buffer_count=5:goto Result_moji_check:
12710 endif
12720 next i
12730 '6画の文字
12740 for i=0 to ((Moji_6)-1)
12750 if (name$=buf_char_hiragana6$(i)) then
12760 buffer_count=6:goto Result_moji_check:
12770 endif
12780 next i
12790 '7画の文字
12800 for i=0 to ((Moji_7)-1)
12810 if (name$=buf_char_hiragana7$(i)) then
12820 buffer_count=7:goto Result_moji_check:
12830 endif
12840 next i
12850 '8画の文字 120 文字
12860 for i=0 to ((Moji_8)-1)
12870 if (name$=buf_char_hiragana8$(i)) then
12880 buffer_count=8:goto Result_moji_check:
12890 endif
12900 next i
12910 '9画の文字  103文字
12920 for i=0 to ((Moji_9)-1)
12930 if (name$=buf_char_hiragana9$(i)) then
12940 buffer_count=9:goto Result_moji_check:
12950 endif
12960 next i
12970 '10画の文字 98文字
12980 for i=0 to ((Moji_10)-1)
12990 if (name$=buf_char_hiragana10$(i)) then
13000 buffer_count=10:goto Result_moji_check:
13010 endif
13020 next i
13030 '11画の文字 98文字
13040 for i=0 to ((Moji_11)-1)
13050 if (name$=buf_char_hiragana11$(i)) then
13060 buffer_count=11:goto Result_moji_check:
13070 endif
13080 next i
13090 '12画の文字
13100 for i=0 to ((Moji_12)-1)
13110 if (name$=buf_char_hiragana12$(i)) then
13120 buffer_count=12:goto Result_moji_check:
13130 endif
13140 next i
13150 '13画の文字
13160 for i=0 to ((Moji_13)-1)
13170 if (name$=buf_char_hiragana13$(i)) then
13180 buffer_count=13:goto Result_moji_check:
13190 endif
13200 next i
13210 '14画の文字
13220 for i=0 to ((Moji_14)-1)
13230 if (name$=buf_char_hiragana14$(i)) then
13240 buffer_count=14:goto Result_moji_check:
13250 endif
13260 next i
13270 '15画の文字
13280 for i=0 to ((Moji_15)-1)
13290 if (name$=buf_char_hiragana15$(i)) then
13300 buffer_count=15:goto Result_moji_check:
13310 endif
13320 next i
13330 '16画の文字
13340 for i=0 to ((Moji_16)-1)
13350 if (name$=buf_char_hiragana16$(i)) then
13360 buffer_count=16:goto Result_moji_check:
13370 endif
13380 next i
13390 '17画の文字
13400 for i=0 to ((Moji_17)-1)
13410 if (name$=buf_char_hiragana17$(i)) then
13420 buffer_count=17:goto Result_moji_check:
13430 endif
13440 next i
13450 '18画の文字 25
13460 for i=0 to ((Moji_18)-1)
13470 if (name$=buf_char_hiragana18$(i)) then
13480 buffer_count=18:goto Result_moji_check:
13490 endif
13500 next i
13510 '19画の文字 17
13520 for i=0 to ((Moji_19)-1)
13530 if (name$=buf_char_hiragana19$(i)) then
13540 buffer_count=19:goto Result_moji_check:
13550 endif
13560 next i
13570 '20画の文字 13
13580 for i=0 to ((Moji_20)-1)
13590 if (name$=buf_char_hiragana20$(i)) then
13600 buffer_count=20:goto Result_moji_check:
13610 endif
13620 next i
13630 '21画の文字 6
13640 for i=0 to ((Moji_21)-1)
13650 if (name$=buf_char_hiragana21$(i)) then
13660 buffer_count=21:goto Result_moji_check:
13670 endif
13680 next i
13690 '22画の文字 4
13700 for i=0 to ((Moji_22)-1)
13710 if (name$=buf_char_hiragana22$(i)) then
13720 buffer_count=22:goto Result_moji_check:
13730 endif
13740 next i
13750 '23画の文字 3
13760 for i=0 to ((Moji_23)-1)
13770 if (name$=buf_char_hiragana23$(i)) then
13780 buffer_count=23:goto Result_moji_check:
13790 endif
13800 next i
13810 '24画の文字
13820 for i=0 to ((Moji_24)-1)
13830 if (name$=buf_char_hiragana24$(i)) then
13840 buffer_count=24:goto Result_moji_check:
13850 endif
13860 next i
13870 'Menu3 結果表示 画数の登録確認
13880 Result_moji_check:
13890 if (buffer_count=0) then
13900 '登録文字がない場合の処理
13910 'グラフィック領域　ここから
13920 cls 3
13930 line (0,0)-(850,40),rgb(0,0,255),bf
13940 line (0,40)-(850,200),rgb(127,255,212),bf
13950 line (0,203)-(853,323),rgb(0,0,255),bf
13960 line (0,320)-(850,520),rgb(0,255,0),bf
13970 'グラフィック領域　ここまで
13980 color rgb(255,255,255):print"登録文字数結果確認"+chr$(13)
13990 color rgb(255,0,0):print name$;"は、登録されていません"+chr$(13)
14000 talk "この文字は、登録されていません"
14010 color rgb(255,255,255):print"q+エンターキー:トップ画面"+chr$(13)
14020 COLOR rgb(255,255,255):print"エンターキー:もう一度調べる"+chr$(13)
14030 color rgb(0,0,0):print"コマンド:"+chr$(13)
14040 key$=input$(1)
14050 if key$="q" then goto Main_Screen:
14060 if key$=chr$(13) then goto Menu2_moji_check:
14070 else
14080 'グラフィック描画領域　ここから
14090 cls 3
14100 line (0,0)-(850,52),rgb(0,0,255),bf
14110 pen 5:line (0,0)-(853,55),rgb(255,255,255),b
14120 line (0,52)-(850,102),rgb(127,255,212),bf
14130 pen 5:line (0,55)-(847,99),rgb(0,0,0),b
14140 line (0,102)-(850,260),rgb(0,0,255),bf
14150 pen 5:line(0,105)-(847,257),rgb(255,0,255),b
14160 line (0,260)-(850,360),rgb(0,255,0),bf
14170 pen 5:line (0,257)-(853,363),rgb(0,0,0),b
14180 'グラフィック描画領域　ここまで
14190 color rgb(255,255,255):print "登録文字画数結果表示"
14200 talk "この文字は"+ str$(buffer_count) +"かくでとうろくされています":color rgb(255,0,255):print name$;"は、";buffer_count;"画で登録されています":
14210 endif
14220 color rgb(255,255,255)
14230 print"q+エンターキー:トップ画面"+chr$(13)
14240 print"エンターキー:もう一度やる"+chr$(13)
14250 color rgb(0,0,0)
14260 print"コマンド:" + chr$(13)
14270 key$=input$(1)
14280 if key$=chr$(13)  then buffer_count=0:goto Menu2_moji_check:
14290 if key$="q" then buffer_count=0:goto Main_Screen:
14300 if not(key$="q") then goto Result_moji_check:
14310 'Menu2 名前の陰陽を見る
14320 'グラフィック描画領域 ここから
14330 Input_name_InYo:
14340 cls 3:line (0,0)-(820,60),rgb(0,0,255),bf
14350 pen 5:line(0,0)-(823,63),rgb(255,255,255),b
14360 LINE (0,60)-(820,250),rgb(127,255,212),bf
14370 pen 5:line(0,57)-(817,247),rgb(255,0,255),b
14380 line (0,250)-(820,350),rgb(0,255,0),bf
14390 pen 5:line(0,253)-(823,353),rgb(0,0,0),b
14400 'グラフィック描画領域　ここまで
14410 color rgb(255,255,255)
14420 print"Menu2 名前の陰陽を見る"+chr$(13)
14430 COLOR rgb(255,0,255)
14440 PRINT"(●:陽,○:陰)"+chr$(13)
14450 print"調べたい名前苗字を入れてください"+chr$(13)
14460 color rgb(0,0,0)
14470 Input"調べたい名前の苗字:",name$
14480 'Menu2 陰陽の吉凶を見る 名入力
14490 cls:color rgb(255,255,255)
14500 print"Menu2 名前の陰陽を見る"+chr$(13)
14510 color rgb(255,0,255)
14520 print"(●:陽,○:陰)"+chr$(13)
14530 print"調べたい名前の名を入れてください"+chr$(13)
14540 color rgb(0,0,0)
14550 Input"調べたい名前の名:",name2$
14560 for i=0 to len(name$)-1
14570 name_array$(i)=Mid$(name$,i+1,1)
14580 if char_count(name_array$(i)) mod 2 = 1  then
14590 name_array$(i)="○":buffer$=buffer$+name_array$(i)
14600 else
14610 name_array$(i)="●":buffer$=buffer$+name_array$(i)
14620 endif
14630 next i
14640 for i=0 to len(name2$)-1
14650 name_array2$(i)=Mid$(name2$,i+1,1)
14660 if char_count(name_array2$(i)) mod 2 = 1 then
14670 name_array2$(i)="○":buffer2$=buffer2$+name_array2$(i)
14680 else
14690 name_array2$(i)="●":buffer2$=buffer2$+name_array2$(i)
14700 endif
14710 next i
14720 bufname$=buffer$+buffer2$
14730 '陰陽のタイプ ここから
14740 select case (len(bufname$))
14750 '2文字
14760 case 2:
14770 if ((bufname$="○●") or (bufname$="●○")) then buffer_name$="吉相:姓名2字の陰陽吉相"
14780 '
14790 '  endif
14800 if ((bufname$="○○") or (bufname$="●●")) then buffer_name$ = "一律陰陽:大凶相"
14810 '  endif
14820 '3文字
14830 case 3:
14840 if (((bufname$)="●○○") or ((bufname$)="○○●") or ((bufname$)="●●○") or ((bufname$)="○●●")) then buffer_name$="吉相:姓名3字陰陽吉相"
14850 if (((bufname$)="●○●") or ((bufname$)="○●○")) then buffer_name$="凶相:ハサミ陰陽"
14860 if (((bufname$)="●●●") or ((bufname$)="○○○")) then buffer_name$="大凶相:一律陰陽"
14870 '4文字
14880 case 4:
14890 if bufname$="●○●○" or bufname$="○●○●" or bufname$ ="●●○●" or bufname$ ="○○●○" or bufname$="●○●●" or bufname$="○●○○" then buffer_name$="吉相:陰陽吉相"
14900 if bufname$="●○○●" or bufname$="○●●○" then buffer_name$="凶相:ハサミ陰陽"
14910 if bufname$="○○○●" or bufname$="●●●○"  then buffer_name$="凶相:片寄り陰陽"
14920 if bufname$="●●○○" or bufname$="○○●●"  then buffer_name$="大凶相:分離陰陽"
14930 if bufname$ ="●●●●" or bufname$ = "○○○○"  then buffer_name$="大凶相:一律陰陽"
14940 '5文字
14950 case 5:
14960 if bufname$="○●○○●" or bufname$="●○●●○" or bufname$="○●○●●" or bufname$="●○●○○" or bufname$="●○○●○" or bufname$="●○●●●" or bufname$="○●○○○" or bufname$="○○●○●" or  bufname$="●●○○●" or bufname$="●○○●●" or bufname$="○○●●○" or bufname$="○●●○○"  or bufname$="○●○○○" or bufname$="●●●○●" or bufname$="○●○●●" Then buffer_name$="吉相:陰陽吉相"
14970 if bufname$="○○●○○" or bufname$="●●○●●" then buffer_name$="大凶相:中縛り陰陽"
14980 if bufname$="●●●○○" or bufname$="○○○●●" then buffer_name$="大凶相:分離陰陽"
14990 if bufname$="○●●●○" or bufname$="●○○○●" or bufname$="●○●○●" or bufname$="○●○●○" then buffr_name$="凶相:ハサミ陰陽"
15000 case 6:
15010 if bufname$="○○○○○○" or bufname$="●●●●●●" then buffer_name$="大凶相:一律陰陽"
15020 if bufname$="●●●○○○" or bufname$="○○○●●●" then buffer_name$="大凶相:分離陰陽"
15030 if bufname$="○○●●○○" or bufname$="●●○○●●" then buffer_name$="大凶相:中縛り陰陽"
15040 if bufname$="○●○○○●" or bufname$="○●○●○○" or bufname$="●○●●●○" or bufname$="●○●○●●" or bufname$="●○○●○○" or bufname$="○●●○●●" then buffer_name$="吉相:陰陽吉相"
15050 case else:
15060 buffer_name$="例外に入りました"
15070 end select
15080 '陰陽のタイプ　ここまで
15090 'グラフィック描画領域　ここから
15100 Result_Inyo:
15110 cls 3
15120 line (0,0)-(900,60),rgb(0,0,250),bf
15130 pen 5:line(0,0)-(903,63),rgb(255,255,255),b
15140 line (0,60)-(900,250),rgb(127,255,212),bf
15150 pen 5:line(0,57)-(897,297),rgb(255,0,255),b
15160 line (0,250)-(900,460),rgb(0,255,0),bf
15170 pen 5:line(0,247)-(897,457),rgb(0,0,0),b
15180 'グラフィック描画領域 ここまで
15190 color rgb(255,255,255)
15200 cls:print"名前:";name$ + name2$ + chr$(13)
15210 color rgb(255,0,255)
15220 print"陰陽配列(陽:●,陰:○)";buffer$ + buffer2$ + chr$(13)
15230 print buffer_name$;chr$(13)
15240 color rgb(0,0,0)
15250 print"エンターキー:トップ画面へ行く"+chr$(13)
15260 print"S or s:保存する"+chr$(13)
15270 key$=input$(1)
15280 '1.メイン画面に行く
15290 if key$=chr$(13) then buffer$="":buffer2$="": goto Main_Screen:
15300 '2.データーの保存
15310 if key$="S" or key$="s" then goto Save_Inyo_array:
15320 'Menu3
15330 Menu2_Entry_moji:
15340 '登録文字数の確認
15350 totalmoji=Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+moji_18+Moji_19+Moji_20+Moji_21+Moji_21+moji_22+Moji_23+Moji_24:
15360 'グラフィック描画領域　ここから
15370 cls 3
15380 line (0,0)-(780,60),rgb(0,0,255),bf
15390 pen 5:line(0,0)-(777,57),rgb(255,255,255),b
15400 line (0,60)-(780,170),rgb(127,255,212),bf
15410 pen 5:line(0,64)-(783,173),rgb(0,0,255),b
15420 line (0,167)-(777,267),rgb(0,255,0),bf
15430 pen 5:line(0,173)-(783,273),rgb(0,0,0),b
15440 'グラフィック描画領域 ここまで
15450 color rgb(255,255,255)
15460 PRINT"登録文字数の確認"+chr$(13)
15470 color rgb(255,0,255)
15480 PRINT"登録文字数は";totalmoji;"文字です"+chr$(13)
15490 TALK"登録文字数は"+str$(totalmoji)+"もじです"
15500 color rgb(0,0,0)
15510 print"エンターキーを押してください"+chr$(13)
15520 key$=input$(1)
15530 if key$=chr$(13) then goto Main_Screen:
15540 'Menu2 文字の総数で名前の吉凶を見る（総数で判定)
15550 Menu1_2_Total_name:
15560 talk"名前の総数で吉凶を判定します。名前を入れてください"
15570 'グラフィック描画領域　ここから
15580 cls 3
15590 line (0,0)-(650,60),rgb(0,0,250),bf
15600 line (0,60)-(650,140),rgb(127,255,212),bf
15610 line (0,140)-(650,220),rgb(0,255,0),bf
15620 'グラフィック描画領域　ここまで
15630 buf=0
15640 color rgb(255,255,255)
15650 Print"名前の総数で吉凶を判断します"+chr$(13)
15660 color rgb(255,0,255)
15670 PRINT"名前を入れてください"+chr$(13)
15680 color rgb(0,0,0)
15690 Input"名前:",name$
15700 for n=0 to (len(name$)-1)
15710 buf_Input_data$(n)=mid$(name$,n+1,1)
15720 buf=buf+char_count(buf_Input_data$(n))
15730 next n
15740 cls:color rgb(255,255,255):print name$;"の総数:";buf;chr$(13)
15750 color rgb(255,0,255):print name$;"の吉凶:";buf_Kikkyo$(buf-1);chr$(13)
15760 color rgb(0,0,0):Input"エンターキーを押してください",key$
15770 if key$="" then goto Main_Screen:
15780 '名前2文字
15790 'グラフィック描画領域　ここから
15800 Menu2_Result_Anzai_Kikkyo:
15810 CLS 3
15820 line (0,0)-(1350,60),rgb(0,0,255),bf
15830 pen 5:line(0,0)-(1347,57),rgb(255,255,255),b
15840 line (0,60)-(1350,560),rgb(127,255,212),bf
15850 pen 5:line(0,63)-(1353,563),rgb(255,0,255),b
15860 line (0,560)-(1350,680),rgb(0,255,0),bf
15870 pen 5:line(0,563)-(1353,683),rgb(0,0,0),b
15880 'グラフィック描画領域 ここまで
15890 color rgb(255,255,255):print"名前:";bufname$;bufname2$;chr$(13)
15900 color rgb(255,0,255)
15910 print"天運";buf_tenunn;chr$(13)
15920 print"地運";buf_chiunn;",地運の吉凶(初年運:0〜20歳):";buf_Kikkyo_Anzai_chiunn$(buf_chiunn-1);chr$(13)
15930 print"人運";buf_jinunn;",人運の吉凶(中年運:20〜50歳):";buf_Kikkyo_Anzai_jinunn$(buf_jinunn-2);chr$(13)
15940 print"外運";buf_gaiunn;chr$(13)
15950 print"総数";buf_total;",総運の吉凶(晩年運:50歳以上):";buf_Kikkyo_Anzai_total$(buf_total-2);chr$(13)
15960 COLOR rgb(0,0,0)
15970 print "エンターキーを押してください"+chr$(13)
15980 key$=input$(1)
15990 if key$=chr$(13) then goto Main_Screen:
16000 '参考文献 表示 ここから
16010 'グラフィック描画領域　 ここから
16020 Reference_book:
16030 cls 3
16040 line (0,0)-(1100,60),rgb(0,0,255),bf
16050 pen 5:line(0,0)-(1103,63),rgb(255,255,255),b
16060 line (0,60)-(1100,650),rgb(127,255,212),bf
16070 pen 5:line(0,63)-(1103,653),rgb(255,255,255),b
16080 line (0,650)-(1100,730),rgb(0,255,0),bf
16090 pen 5:line(0,653)-(1103,733),rgb(0,0,0),b
16100 'グラフィック描画領域  ここまで
16110 '参考文献１
16120 color rgb(255,255,255)
16130 print"◎参考文献"+chr$(13)
16140 color rgb(255,0,255)
16150 print "参考文献１"+chr$(13)
16160 print "Title:九星姓名判断"+chr$(13)
16170 print "Author:高嶋　 美伶"+chr$(13)
16180 print "出版社:日本文芸者"+chr$(13)
16190 print "ISBN:4-537-20073-1"+chr$(13)
16200 print "定価:1,200+税"+chr$(13)
16210 color rgb(0,0,0)
16220 print "エンターキーを押してください"+chr$(13)
16230 key$=input$(1)
16240 if key$=chr$(13) then goto Reference_book2:
16250 '参考文献２
16260 Reference_book2:
16270 cls
16280 color rgb(255,255,255)
16290 print "◎参考文献"+chr$(13)
16300 color rgb(255,0,255)
16310 print "参考文献２"+chr$(13)
16320 print "Title:究極の姓名判断"+chr$(13)
16330 print "Author:安斎　勝洋"+chr$(13)
16340 print "出版社:説話社"+chr$(13)
16350 print "ISBN:978-4-916217-61-5"+chr$(13)
16360 print "定価:1,800円+税"+chr$(13)
16370 color rgb(0,0,0)
16380 print "エンターキーを押してください"+chr$(13)
16390 key$=input$(1)
16400 if key$=chr$(13) then goto Reference_book3:
16410 '参考文献３
16420 Reference_book3:
16430 cls
16440 color rgb(255,255,255)
16450 print"◎参考文献"+chr$(13)
16460 color rgb(255,0,255)
16470 print "参考文献3"+chr$(13)
16480 print "Title:新明解現在漢和辞典"+chr$(13)
16490 print "Author:影山輝國(編集主幹)他"+chr$(13)
16500 print "出版社:三省堂"+chr$(13)
16510 print "ISBN:978-4-385-13755-1"+chr$(13)
16520 print "定価:2,800円 + 税"+chr$(13)
16530 print "エンターキーを押してください"+chr$(13)
16540 'トップ画面に戻る
16550 key$=input$(1)
16560 if key$=chr$(13) then goto Main_Screen:
16570 '安斎流姓名判断　メニュー
16580 'グラフィック領域　ここから
16590 Menu1_2_Anzai_Top:
16600 cls 3
16610 line (0,0)-(1000,60),rgb(0,0,255),bf
16620 pen 5:line(0,0)-(1003,63),rgb(255,255,255),b
16630 line (0,60)-(1000,450),rgb(127,255,212),bf
16640 pen 5:line(0,63)-(1003,453),rgb(255,0,255),b
16650 line (0,450)-(1000,630),rgb(0,255,0),bf
16660 pen 5:line(0,453)-(1003,633),rgb(0,0,0),b
16670 'グラフィック描画領域　ここまで
16680 color rgb(255,255,255)
16690 print "安斎流姓名判断　トップメニュー" + chr$(13)
16700 color rgb(255,0,255)
16710 print "1.安斎流姓名判断 名前の吉凶判定" + chr$(13)
16720 print "2.安斎流姓名判断 改名チェック" + chr$(13)
16730 print "3.安斎流姓名判断 相性占い"+chr$(13)
16740 print "4.前の画面に戻る"+chr$(13)
16750 color rgb(0,0,0)
16760 print"番号を選んでください"+chr$(13)
16770 Input "番号:",key
16780 if key=1 then goto Menu2_Anzai_Kikkyo:
16790 if key=2 then goto Menu2_Anzai_name_check:
16800 if key=3 then goto Anzai_Aisyou_Top:
16810 if key=4 then goto SeimeiHandan_Top:
16820 '2.安斎流姓名判断　男女の相性占い　ここから
16830 'グラフィック描画領域 ここから
16840 Anzai_Aisyou2:
16850 cls 3
16860 line (0,0)-(850,60),rgb(0,0,255),bf
16870 pen 5:line(0,0)-(853,63),rgb(255,255,255),b
16880 line (0,60)-(850,180),rgb(127,255,212),bf
16890 line (0,63)-(853,183),rgb(255,0,255),b
16900 line (0,180)-(850,270),rgb(0,255,0),bf
16910 pen 5:line(0,183)-(853,273),rgb(0,0,0),b
16920 'グラフィック描画領域　男女の相性占い ここまで
16930 's2=1:男
16940 if s2 = 1 then goto Input_female:
16950 's2=2:女
16960 if s2 = 2 then goto Input_male:
16970 '1.名前の姓を入力  男性
16980 's2=2:女
16990 's2=1:男
17000 Input_male:
17010 color rgb(255,255,255)
17020 print "安斎流姓名判断　相性占い(男性)"+chr$(13)
17030 color rgb(255,0,255)
17040 print "男性の名前(姓)を入れてください"+chr$(13)
17050 color rgb(0,0,0)
17060 Input "男性の名前(姓):",name$
17070 '2.名前の名を入力  男性
17080 cls
17090 color rgb(255,255,255)
17100 print "安斎流姓名判断 相性占い(男性)"+chr$(13)
17110 color rgb(255,0,255)
17120 print "男性の名前（名）をいれてください"+chr$(13)
17130 color rgb(0,0,0)
17140 Input "男性の名前(名):",name2$
17150 's2=2:女
17160 's2=1:男
17170 if s2=2 then goto male_complate:
17180 '3.名前(姓)入力 女性
17190 Input_female:
17200 cls
17210 color rgb(255,255,255)
17220 print "安斎流姓名判断 相性占い(女性)"+chr$(13)
17230 color rgb(255,0,255)
17240 print "女性の名前(姓)を入れてください"+chr$(13)
17250 color rgb(0,0,0)
17260 Input"女性の名前:",name3$
17270 '4.名前（名)入力 女性
17280 cls
17290 color rgb(255,255,255)
17300 print "安斎流姓名判断 相性占い(女性)"+chr$(13)
17310 color rgb(255,0,255)
17320 print "女性の名前（名）を入れてください"+chr$(13)
17330 color rgb(0,0,0)
17340 Input "女性の名前(名):",name4$
17350 '男性　の地運 を求める
17360 '姓名の合計数
17370 '1.男性
17380 male_complate:
17390 buff_name1 = len(name$)
17400 buff_name2 = len(name2$)
17410 buff_name = buff_name1 + buff_name2
17420 '診断結果に飛ぶ
17430 'goto Anzai_Result_Aisyou_male_female:
17440 '2.女性
17450 'female_complate:
17460 buff_name3 = len(name3$)
17470 buff_name4 = len(name4$)
17480 buff_wname = buff_name3 + buff_name4
17490 '診断結果に飛ぶ
17500 goto Anzai_Result_Aisyou_male_female:
17510 '1.男性の地運を求める
17520 select case buff_name
17530 case 2:
17540 '男性の地運を求める
17550 buf_chiunn=char_count(name2$)
17560 case 3:
17570 '姓が一文字 名が2文字
17580 if buff_name1=1 and buff_name2=2 then
17590 buf_Input_name$(0)=mid$(name2$,1,1)
17600 buf_Input_name$(1)=mid$(name2$,2,1)
17610 '地運を計算
17620 buf_chiunn=char_count(buf_Input_name$(0))+char_count(buf_Input_name$(1))
17630 endif
17640 if buff_name1=2 and buff_name2=1 then
17650 buf_Input_name$(0)=Mid$(name2$,1,1)
17660 buf_chiunn=char_count(buf_Input_name$(0))
17670 endif
17680 case 4:
17690 '1.姓１，名３
17700 if buff_name1=1 and buff_name2=3 then
17710 buf_Input_name$(0)=Mid$(name2$,1,1)
17720 buf_Input_name$(1)=Mid$(name2$,2,1)
17730 buf_Input_name$(2)=Mid$(name2$,3,1)
17740 buf_chiunn=char_count(buf_Input_name$(0))+char_count(buf_Input_name$(1))+char_count(buf_Input_name$(2))
17750 endif
17760 '2.姓２,名２
17770 if buff_name1=2 and buff_name2=2 then
17780 buf_Input_name$(0)=Mid$(name2$,1,1)
17790 buf_Input_name$(1)=Mid$(name2$,2,1)
17800 buf_chiunn=char_count(buf_Input_name$(0))+char_count(buf_Input_name$(1))
17810 endif
17820 '3.姓３、名１
17830 if buff_name1=3 and buff_name2=1 then
17840 buf_Input_name$(0)=Mid$(name2$,1,1)
17850 '地運を求める
17860 buf_chiunn=char_count(buf_Input_name$(0))
17870 endif
17880 case 5:
17890 '1.姓２，名３
17900 if buff_name1=2 and buff_name2=3 then
17910 buf_Input_name$(0)=Mid$(name2$,1,1)
17920 buf_Input_name$(1)=Mid$(name2$,2,1)
17930 buf_Input_name$(2)=Mid$(name2$,3,1)
17940 '地運を求める
17950 buf_chiunn=char_count(buf_Input_name$(0))+char_count(buf_Input_name$(1))+char_count(buf_Input_name$(2))
17960 endif
17970 '2.姓３，名２
17980 if buff_name1=3 and buff_name2=2 then
17990 buf_Input_name$(0)=Mid$(name2$,1,1)
18000 buf_Input_name$(1)=Mid$(name2$,2,1)
18010 '地運を求める
18020 buf_chiunn=char_count(buf_Input_name$(0))+char_count(buf_Input_name$(1))
18030 endif
18040 '3.姓４、名１
18050 buf_Input_name$(0)=Mid$(name2$,1,1)
18060 '地運を求める
18070 buf_chiunn = char_count(buf_Input_name$(0))
18080 case 6:
18090 '1.姓３，名３
18100 if buff_name1=3 and buff_name2=3 then
18110 buf_Input_name$(0)=Mid$(name2$,1,1)
18120 buf_Input_name$(1)=Mid$(name2$,2,1)
18130 buf_Input_name$(2)=Mid$(name2$,3,1)
18140 '地運を求める
18150 buf_chiunn = char_count(buf_Input_name$(0)) + char_count(buf_Input_name$(1))+char_count(buf_Input_name$(2))
18160 endif
18170 '２.姓４，名２
18180 if buff_name1=4 and buff_name2=2 then
18190 buf_Input_name$(0)=Mid$(name2$,1,1)
18200 buf_Input_name$(1)=Mid$(name2$,2,1)
18210 '地運を求める
18220 buf_chiunn = char_count(buf_Input_name$(0)) + char_count(buf_Input_name$(1))
18230 endif
18240 case else:
18250 end select
18260 'if s2=1 then goto Input_female:
18270 'if s2=2 then goto Main_Screen:
18280 '2.女性　外運を求める
18290 select case buff_wname
18300 '姓と名の合計数
18310 case 2:
18320 buf_Input_name2$(0)=Mid$(name3$,1,1)
18330 buf_Input_name2$(1)=Mid$(name4$,1,1)
18340 buf_gaiunn=char_count(buf_Input_name2$(0)) + char_count(buf_Input_name2$(1))
18350 case 3:
18360 if buff_name3=2 and buff_name4=1 then
18370 buf_Input_name2$(0)=Mid$(name3$,1,1)
18380 buf_Input_name2$(1)=Mid$(name3$,2,1)
18390 buf_Input_name2$(2)=Mid$(name4$,1,1)
18400 buf_gaiunn=char_count(buf_Input_name2$(0))+char_count(buf_Input_name2$(2))
18410 endif
18420 if buff_name3=1 and buff_name4=2 then
18430 buf_Input_name2$(0)=Mid$(name3$,1,1)
18440 buf_Input_name2$(1)=Mid$(name4$,1,1)
18450 buf_Input_name2$(2)=Mid$(name4$,2,1)
18460 buf_gaiunn=char_count(buf_Input_name2$(0))+char_count(buf_Input_name2$(2))
18470 endif
18480 case 4:
18490 '姓１、名３
18500 if buff_name3=1 and buff_name4=3 then
18510 buf_Input_name2$(0)=Mid$(name3$,1,1)
18520 buf_Input_name2$(1)=Mid$(name4$,1,1)
18530 buf_Input_name2$(2)=Mid$(name4$,2,1)
18540 buf_Input_name2$(3)=Mid$(name4$,3,1)
18550 '外運を求める
18560 buf_gaiunn=char_count(buf_Input_name2$(0))+char_count(buf_Input_name2$(2))+char_count(buf_Input_name2$(3))
18570 endif
18580 '姓２,名２
18590 if buff_name3=2 and buff_name4=2 then
18600 buf_Input_name2$(0)=Mid$(name3$,1,1)
18610 buf_Input_name2$(1)=Mid$(name3$,2,1)
18620 buf_Input_name2$(2)=Mid$(name4$,1,1)
18630 buf_Input_name2$(3)=Mid$(name4$,2,1)
18640 '外運を求める
18650 buf_gaiunn=char_count(buf_Input_name2$(0))+char_count(buf_Input_name2$(3))
18660 endif
18670 '姓３，名１
18680 if buff_name3=3 and buff_name4=1 then
18690 buf_Input_name2$(0)=Mid$(name3$,1,1)
18700 buf_Input_name2$(1)=Mid$(name3$,2,1)
18710 buf_Input_name2$(2)=Mid$(name3$,3,1)
18720 buf_Input_name2$(3)=Mid$(name4$,1,1)
18730 '外運を求める
18740 buf_gaiunn=char_count(buf_Input_name2$(0))+char_count(buf_Input_name2$(1))+char_count(buf_Input_name2$(3))
18750 endif
18760 case 5:
18770 '姓 3,名2
18780 if buff_name3=3 and buff_name=2 then
18790 buf_Input_name2$(0)=Mid$(name3$,1,1)
18800 buf_Input_name2$(1)=Mid$(name3$,2,1)
18810 buf_Input_name2$(2)=Mid$(name3$,3,1)
18820 buf_Input_name2$(3)=Mid$(name4$,1,1)
18830 buf_Input_name2$(4)=Mid$(name4$,2,1)
18840 '外運を求める
18850 buf_gaiunn=char_count(buf_Input_name2$(0))+char_count(buf_Input_name2$(1))+char_count(buf_Input_name2$(4))
18860 endif
18870 '姓４、名１
18880 if buff_name3=4 and buff_name4=1 then
18890 buf_Input_name2$(0)=Mid$(name3$,1,1)
18900 buf_Input_name2$(1)=Mid$(name3$,2,1)
18910 buf_Input_name2$(2)=Mid$(name3$,3,1)
18920 buf_Input_name2$(3)=Mid$(name3$,4,1)
18930 buf_Input_name2$(4)=Mid$(name4$,1,1)
18940 '外運を求める
18950 buf_gaiunn=char_count(buf_Input_name2$(0))+char_count(buf_Input_name2$(1))+char_count(buf_Input_name$(4))
18960 endif
18970 '姓２、名３
18980 if buff_name3=2 and buff_name4=3 then
18990 buf_Input_name2$(0)=Mid$(name3$,1,1)
19000 buf_Input_name2$(1)=Mid$(name3$,2,1)
19010 buf_Input_name2$(2)=Mid$(name4$,1,1)
19020 buf_Input_name2$(3)=Mid$(name4$,2,1)
19030 buf_Input_name2$(4)=Mid$(name4$,3,1)
19040 '外運を求める
19050 buf_gaiunn=char_count(buf_Input_name$(0))+char_count(buf_Input_name$(3))+char_count(buf_Input_name$(4))
19060 endif
19070 case 6:
19080 '1.姓３，名３
19090 if buff_name3=3 and buff_name4=3 then
19100 buf_Input_name2$(0)=Mid$(name3$,1,1)
19110 buf_Input_name2$(1)=Mid$(name3$,2,1)
19120 buf_Input_name2$(2)=Mid$(name3$,3,1)
19130 buf_Input_name2$(3)=Mid$(name4$,1,1)
19140 buf_Input_name2$(4)=Mid$(name4$,2,1)
19150 buf_Input_name2$(5)=Mid$(name4$,3,1)
19160 '外運を求める
19170 buf_gaiunn=char_count(buf_Input_name2$(0))+char_count(buf_Input_name2$(1))+char_count(buf_Input_name2$(4))+char_count(buf_Input_name$(5))
19180 endif
19190 '2.姓４，名２
19200 if buff_name3=4 and buff_name4=2 then
19210 buf_Input_name2$(0)=Mid$(name3$,1,1)
19220 buf_Input_name2$(1)=Mid$(name3$,2,1)
19230 buf_Input_name2$(2)=Mid$(name3$,3,1)
19240 buf_Input_name2$(3)=Mid$(name3$,4,1)
19250 buf_Input_name2$(4)=Mid$(name4$,1,1)
19260 buf_Input_name2$(5)=Mid$(name4$,2,1)
19270 '外運を求める
19280 buf_gaiunn=char_count(buf_Input_name2$(0))+char_count(buf_Input_name2$(1))+char_count(buf_Input_name$(5))
19290 endif
19300 case 7:
19310 '1姓４，名３
19320 '外運を求める
19330 end select
19340 if s2=1 then goto Input_female:
19350 if s2=2 then goto Main_Screen:
19360 func buf_number(a)
19370 if a < 10 then
19380 buf_tansu=a
19390 endif
19400 if a>9 and a < 20 then
19410 buf_tansu = a - 10
19420 endif
19430 if a>19 and a < 30 then
19440 buf_tansu = a - 20
19450 endif
19460 endfunc buf_tansu
19470 func Aisyou_type$(man,woman)
19480 Result$="No data"
19490 '1.理解し合える最良のカップル
19500 '1のFor文
19510 for i=0 to 19
19520 if buf_good_couple1(i) = man and buf_good_couple2(i) = woman then
19530 Result$ = "1.理解し合える最良のカップル"
19540 ResultNo = 0
19550 endif
19560 if buf_natural_couple1(i) = man and  buf_natural_couple2(i) = woman then
19570 Result$="2.互いに自然体でつきあえるカップル"
19580 ResultNo=1
19590 endif
19600 '3.男性にとって居心地の良いカップル
19610 if buf_good_for_man1(i)= man AND buf_good_for_man2(i)= woman then
19620 Result$="3.男性にとって居心地の良いカップル"
19630 ResultNo=2
19640 endif
19650 '4.女性にとって居心地の良いカップル
19660 if buf_good_for_woman1(i) = man AND buf_good_for_woman2(i) = woman then
19670 Result$ = "4.女性にとって居心地の良いカップル"
19680 ResultNo=3
19690 endif
19700 '5.恋愛経験を重ねた後なら愛を育める
19710 'for i=0 to 9
19720 'for j=0 to 9
19730 if short_of_experience1(i) = man AND short_of_experience2(i) = woman then
19740 Result$="5.恋愛経験を重ねた後なら愛を育める"
19750 ResultNo=4
19760 endif
19770 'next j
19780 'next i
19790 '6
19800 if buf_difficult_for_couple1(i)=man AND  buf_difficult_for_couple2(i)=woman then
19810 Result$="6.結婚への発展が困難なカップル"
19820 endif
19830 '7
19840 if buf_difference_of_love1(i)=man AND buf_difference_of_love2(i)=woman then
19850 Result$="7.愛し方にずれが出てくる二人"
19860 endif
19870 '8
19880 if buf_difference_of_KachiKan1(i)=man AND buf_difference_of_KachiKan2(i)=woman  then
19890 Result$="8.互いに価値観が噛み合わない相性"
19900 endif
19910 next i
19920 '
19930 endfunc  Result$
19940 'Anzai_Result_Aisyou_male_female:
19950 cls 3:
19960 buf_t_chiunn = buf_number(buf_chiunn)
19970 buf_t_gaiunn=buf_number(buf_gaiunn)
19980 bufferAisyou$ = Aisyou_type$(buf_t_chiunn,buf_t_gaiunn)
19990 'グラフィック描画領域　ここから
20000 'Anzai_Result_Aisyou_male_female:
20010 line(0,0)-(1200,60),rgb(0,0,255),bf
20020 pen 5:line(0,0)-(1203,63),rgb(255,255,255),b
20030 line(0,60)-(1200,560),rgb(127,255,212),bf
20040 pen 5:line(0,63)-(1203,563),rgb(255,0,255),b
20050 LINE(0,560)-(1200,770),rgb(0,255,0),bf
20060 pen 5:line(0,563)-(1203,773),rgb(0,0,0),b
20070 if s2=1 then goto　read_mydata:
20080 buf_t_chiunn=get_chiunn(name2$)
20090 'グラフィック描画領域　ここまで
20100 color rgb(255,255,255)
20110 print "安斎流姓名判断　相性占い　結果表示"+chr$(13)
20120 color rgb(255,0,255)
20130 print "男性の名前:";name$+name2$;chr$(13)
20140 print "地運の単数";buf_t_chiunn;chr$(13)
20150 print "女性の名前:";name3$+name4$;chr$(13)
20160 print "外運の単数";buf_t_gaiunn;chr$(13)
20170 print"二人の相性:";bufferAisyou$;chr$(13)
20180 color rgb(0,0,0)
20190 print "エンターキー:トップ画面へ行く"+chr$(13)
20200 print "S or s:保存する"+chr$(13)
20210 key$=input$(1)
20220 if key$=chr$(13) then goto Main_Screen:
20230 if key$="s" or key$="S" then goto Save_Good_fortune:
20240 '相性占い　データー保存
20250 'Save_Good_fortune:
20260 '1.ファイル：fortune_list.datが無い時
20270 '1-0.保存フォルダ:config/Kikkyo_data/
20280 '1-1.ファイル:fortune_list.datを作る
20290 '1-2.異性の名前と自分との相性を保存
20300 '1-3.データーを保存したと表示する
20310 Save_Good_fortune:
20320 open "config/Kikkyo_data/fortune_list.dat" for append as #1
20330 '
20340 close #1
20350 '改名チェック
20360 'グラフィック描画領域 ここから
20370 Menu2_Anzai_name_check:
20380 cls 3
20390 '1行目
20400 line (0,0)-(1300,60),rgb(0,0,255),bf
20410 pen 5:line(0,0)-(1297,57),rgb(255,255,255),b
20420 '2行目
20430 line (0,60)-(1300,450),rgb(127,255,212),bf
20440 pen 5:line(0,63)-(1303,453),rgb(255,0,255),b
20450 '3行目
20460 line (0,450)-(1300,550),rgb(0,255,0),bf
20470 pen 5:line(0,453)-(1303,553),rgb(0,0,0),b
20480 'グラフィック描画領域 ここまで
20490 talk"ニックネームまたは会社名から改名が必要かチェックします、10文字以内で名前を入れてください"
20500 color rgb(255,255,255)
20510 print "安斎流姓名判断 改名チェッカー"+chr$(13)
20520 color rgb(255,0,255)
20530 print "総数で、改名が、必要か否かを調べます"+chr$(13)
20540 print "名前(ニックネーム or 会社名等)を" + chr$(13)
20550 print "入れてください" + chr$(13)
20560 print "10文字までで入れてください" + chr$(13)
20570 color rgb(0,0,0)
20580 Input "名前:",name$
20590 '計算領域　ここから
20600 '名前から総運を計算
20610 '1.名前の文字数を出す
20620 n=len(name$)
20630 if n > 10 then
20640 '文字数が10個までという表示
20650 'トーストで表示
20660 ui_msg "文字は10個までです"
20670 goto Menu2_Anzai_name_check:
20680 endif
20690 'それ以外
20700 '総数を出す処理を出す
20710 '画面消去　データー初期化
20720 Result_Anzai_Kaimei:
20730 cls 3:bufer_total=0
20740 'グラフィック描画領域 ここから
20750 line(0,0)-(960,60),rgb(0,0,255),bf
20760 pen 5:line(0,0)-(963,63),rgb(255,255,255),b
20770 line(0,60)-(960,320),rgb(127,255,212),bf
20780 pen 5:line(0,63)-(963,323),rgb(255,0,255),b
20790 line(0,320)-(960,600),rgb(0,255,0),bf
20800 pen 5:line(0,323)-(963,603),rgb(0,0,0),b
20810 'グラフィック描画領域 ここまで
20820 'cls 3
20830 color rgb(255,255,255)
20840 print"安斎流姓名判断　改名チェック　診断結果"+chr$(13)
20850 for i=0 to len(name$)-1
20860 buf_Input_name$(i)=Mid$(name$,i+1,1)
20870 bufer_total = char_count(buf_Input_name$(i)) + bufer_total
20880 next i
20890 color rgb(255,0,255)
20900 print "名前:";name$
20910 print "この名前の総数:";bufer_total
20920 print "この名前の吉凶:";buf_Kikkyo_Anzai_total$(bufer_total - 2);"です"
20930 color rgb(255,0,255)
20940 buffer_total$=Kaimei_check$(buf_Kikkyo_Anzai_total$(bufer_total - 2 ))
20950 print bufer_total$;chr$(13)
20960 color rgb(0,0,0)
20970 locate 0,7
20980 print"エンターキー:メイン画面"+chr$(13)
20990 print"スペース:もう一度やる"+chr$(13)
21000 print"s or S:保存する"+chr$(13)
21010 key$=input$(1)
21020 if key$=chr$(13) then goto Main_Screen:
21030 if key$=" "  then goto Menu2_Anzai_name_check:
21040 if key$="S" or key$="s" then
21050 count=0
21060 if dir$("config/Anzai_Kikkyo/Anzai_Kikkyo_name_list.dat")="" then
21070 count=0
21080 else
21090 open "config/Anzai_Kikkyo/Anzai_Kikkyo_name_list.dat" for input as #1
21100 while eof(1)=0
21110 line input #1,lines$:count=count+1
21120 wend
21130 close #1
21140 endif
21150 if count => 5 then
21160 ui_msg"登録できるのは5件までです。"
21170 goto Result_Anzai_Kaimei:
21180 else
21190 if count<6 then
21200 open "config/Anzai_Kikkyo/Anzai_Kikkyo_name_list.dat" for append as #1
21210 print #1,"名前:";name$;",総数:";str$(bufer_total);",吉凶:";buf_Kikkyo_Anzai_total$(bufer_total-2)
21220 close #1
21230 ui_msg"保存しました"
21240 endif
21250 endif
21260 endif
21270 goto Result_Anzai_Kaimei:
21280 func Kaimei_check$(r$)
21290 if r$="大吉数" or r$="中吉数" or r$="小吉数" or r$="半吉数" or r$="六大吉数" or r$="吉数" then
21300 '改名の必要なし
21310 talk"この名前は改名の必要がございません エンターキーを押してください"
21320 print"この名前は、改名の必要はありません"+chr$(13)
21330 '改名の必要ナシの場合
21340 K=0
21350 else
21360 '改名の必要あり
21370 talk"この名前は、改名の必要があります"
21380 print"この名前は、改名の必要があります"+chr$(13)
21390 K=1
21400 '◎表示パターン
21410 'パターン１
21420 'color rgb(0,0,0)
21430 'Input"エンターキーを押してください",key$
21440 endif
21450 endfunc result$
21460 'ui_msg="1件追加しました,残り9件追加できます"
21470 'ファイルの存在確認 設定ファイル:mydata.dat
21480 Anzai_Result_Aisyou_male_female:
21490 cls 3
21500 '設定ファイルの確認
21510 if dir$("config/Mydata/mydata.dat")="" then
21520 'print "File not found"+chr$(13)
21530 '1.ファイルがない時
21540 goto Input_profile:
21550 else
21560 'ファイルがある時
21570 goto read_mydata:
21580 'goto 16820
21590 endif
21600 '1-1.ファイルがない時の処理
21610 '1-1.自分の姓名判断を入力
21620 'グラフィック描画領域 ここから
21630 Input_profile:
21640 cls 3
21650 line(0,0)-(1000,60),rgb(0,0,250),bf
21660 line(0,60)-(1000,150),rgb(127,255,212),bf
21670 line(0,150)-(1000,240),rgb(0,255,0),bf
21680 'グラフィック描画領域 ここまで
21690 '1.名前の姓の入力
21700 '1行目 Title
21710 color rgb(255,255,255)
21720 print"相性占い　自分のプロフィール入力"+chr$(13)
21730 '2行目 名前の姓を入力
21740 color rgb(255,0,255)
21750 print "自分の名前の姓を入れてください"+chr$(13)
21760 color rgb(0,0,0)
21770 'buf_name1$:自分の名前の姓
21780 Input"名前の姓:",buf_name1$
21790 '2.名前の名の入力
21800 '画面消去
21810 cls
21820 '1行目 Title
21830 color rgb(255,255,255)
21840 print "相性占い 自分のプロフィール入力"+chr$(13)
21850 '2行目 名前の名の入力
21860 color rgb(255,0,255)
21870 print "自分の名前の名を入れてください"+chr$(13)
21880 color rgb(0,0,0)
21890 'buf_name2$:自分の名前の名
21900 input "名前の名:",buf_name2$
21910 '3.性別入力
21920 cls
21930 '1行目 Title
21940 color rgb(255,255,255)
21950 print "相性占い 自分のプロフィール入力"+chr$(13)
21960 '2行目 性別入力
21970 color rgb(255,0,255)
21980 print"自分の性別を入れてください(女性 or 男性)"+chr$(13)
21990 sex_type$(0)="女性"
22000 sex_type$(1)="男性"
22010 type=ui_select("sex_type$","性別を選んでください")
22020 '3行目
22030 '性別変数 sex_type$
22040 if type=1 then
22050 print"自分の性別(女性 or 男性):";sex_type$(1)+chr$(13):sex_type$=sex_type$(1):goto Input_male_:
22060 else
22070 print"自分の性別(女性 or 男性):";sex_type$(0)+chr$(13):sex_type$=sex_type$(0):goto Input_female_:
22080 endif
22090 Input_male_:
22100 if sex_type$ = "男性" then
22110 name$=buf_name1$
22120 name2$=buf_name2$
22130 s2=1
22140 goto Entry_Profile:
22150 endif
22160 Input_female_:
22170 If sex_type$="女性" then
22180 name3$=buf_name1$
22190 name4$=buf_name2$
22200 s=2
22210 goto Entry_Profile:
22220 endif
22230 '登録プロフィール確認画面
22240 Entry_Profile:
22250 cls 3
22260 'グラフィック描画領域　ここから
22270 line(0,0)-(1000,60),rgb(0,0,255),bf
22280 line(0,60)-(1000,60*5),rgb(127,255,212),bf
22290 line(0,300)-(1000,460),rgb(0,255,0),bf
22300 'if s2=2 then goto Main_Screen:
22310 'グラフィック描画領域　ここまで
22320 '1行目 Title
22330 color rgb(255,255,255)
22340 print"安斎流姓名判断 自分のプロフィール　登録確認"+chr$(13)
22350 color rgb(255,0,255)
22360 print"名前:";buf_name1$+buf_name2$;chr$(13)
22370 PRINT"性別:";sex_type$;chr$(13)
22380 if sex_type$="女性" then
22390 buf_t_gaiunn = get_gaiunn(buf_name1$,buf_name2$)
22400 buf_t_gaiunn_tansuu=buf_number(buf_t_gaiunn)
22410 print"外運:";buf_t_gaiunn_tansuu;chr$(13)
22420 buffer$="外運:"+str$(buf_t_gaiunn_tansuu)
22430 endif
22440 if sex_type$="男性" then
22450 buf_chiunn = get_chiunn(buf_name2$)
22460 buf_chiunn_tansuu1 = buf_number(buf_chiunn)
22470 print"地運:";buf_chiunn_tansuu1;chr$(13)
22480 buffer$="地運:" + str$(buf_chiunn_tansuu1)
22490 endif
22500 color rgb(0,0,0)
22510 input"(登録する:Yes/登録しない:No):",key$
22520 if key$="Yes" or key$="yes" then
22530 open "config/Mydata/mydata.dat" for output as #1
22540 print #1,"名前:";buf_name1$+buf_name2$
22550 print #1,"性別:";sex_type$
22560 print #1,buffer$
22570 close #1
22580 ui_msg"データーを保存しました"
22590 goto Main_Screen:
22600 endif
22610 '２．設定ファイルが存在する場合
22620 'ファイル読み込み 自分のデーターを表示
22630 read_mydata:
22640 cls 3:line=0
22650 open "config/Mydata/mydata.dat" for input as #2
22660 Select case line
22670 case 0:
22680 line input #2,a$
22690 line = line + 1
22700 case 1:
22710 line input #2,b$
22720 line = line + 1
22730 case 2:
22740 line input #2,c$
22750 line = line + 1
22760 end Select
22770 close #2
22780 line=0
22790 buffername$=a$
22800 buffername2$=b$
22810 buffername3$=c$
22820 bufff$=Mid$(buffername$,1,3)
22830 buff2$=Mid$(buffername2$,1,3)
22840 buff3$=Mid$(buffername3$,1,3)
22850 n=len(a$)
22860 sextype$=Mid$(buffername2$,4,2)
22870 if sextype$ = "男性" then
22880 '男性:s2
22890 s2=1
22900 '女性のデーター入力
22910 goto Anzai_Aisyou2:
22920 endif
22930 if sextype$="女性" then
22940 s2=2
22950 '男性のデーター入力
22960 goto Anzai_Aisyou2:
22970 endif
22980 '女性のデーター結果表示
22990 '1.プロフィール性別男性の場合 ここから
23000 cls
23010 color rgb(255,255,255)
23020 print "安斎流姓名判断　 相性占い　結果表示"+chr$(13)
23030 name_length = len(bufername$)
23040 myname$ = Mid$(buffername$,4,4)
23050 chiunn = val(Mid$(buffername3$,4,2))
23060 tansuu1 = buf_number(chiunn)
23070 bufname$ = name3$ + name4$
23080 buf_t_gaiunn = get_gaiunn(name3$,name4$)
23090 buf_t_gaiunn_tansuu=buf_number(buf_t_gaiunn)
23100 bufferAisyou$ = Aisyou_type$(tansuu1,buf_t_gaiunn_tansuu)
23110 color rgb(255,0,255)
23120 print "自分の名前(男性):";myname$;chr$(13)
23130 print "地運の端数:";tansuu1;chr$(13)
23140 print "相手の名前(女性):";bufname$;chr$(13)
23150 print "外運の端数:";buf_t_gaiunn_tansuu;chr$(13)
23160 print "二人の相性:";bufferAisyou$;chr$(13)
23170 talk "二人の相性は";bufferAisyou$
23180 color rgb(0,0,0)
23190 print"エンターキー:トップ画面へ行く"+chr$(13)
23200 print"S or s:データーを保存"+chr$(13)
23210 key$=input$(1)
23220 'トップ画面に行く
23230 if key$ = chr$(13) then goto Main_Screen:
23240 if key$="s" or key$="S" then goto Save_my_fortune_list:
23250 'データー保存
23260 'ファイル名:my_fortune_list_male.dat
23270 'フォルダ:config/
23280 'Save_my_fortune_list:相性リストに保存
23290 Save_my_fortune_list:
23300 open "config/Mydata/my_fortune_list_male.dat" for append as #1
23310 print #1,"相手の名前:";bufname$;",あなたとの相性:";bufferAisyou$
23320 close #1
23330 ui_msg "保存しました"
23340 goto Main_Screen:
23350 '1-1.データーを保存する
23360 '1-2.appendモードで保存
23370 '1-3.ui_msgで保存したと表示する
23380 '1-4.終了する
23390 '1.プロフィール性別男性の場合　ここまで
23400 '2.プロフィール性別女性の場合　ここから
23410 cls 3
23420 '描画領域　ここから
23430 line (0,0)-(1200,60),rgb(0,0,255),bf
23440 line (0,60)-(1200,560),rgb(127,255,212),bf
23450 LINE (0,560)-(1200,780),rgb(0,255,0),bf
23460 '描画領域 ここまで
23470 color rgb(255,255,255)
23480 print"安斎流姓名判断　相性占い　結果表示"+chr$(13)
23490 '計算領域　ここから
23500 myname$=Mid$(buffername$,4,4)
23510 gaiunn=val(Mid$(buffername3$,4,2))
23520 buf_t_gaiunn=buf_number(gaiunn)
23530 buf_t_chiunn=buf_number(buf_chiunn)
23540 bufferAisyou$ = Aisyou_type$(buf_t_chiunn,buf_t_gaiunn)
23550 bufname$ = name$ + name2$
23560 '計算領域 ここまで
23570 color rgb(255,0,255)
23580 print "自分の名前(女性):";myname$;chr$(13)
23590 print "外運の端数";buffer_t_gaiunn;chr$(13)
23600 print "相手の名前(男性):";bufname$;chr$(13)
23610 print "地運の端数:";buf_t_chiunn;chr$(13)
23620 print "二人の相性:";bufferAisyou$;chr$(13)
23630 color rgb(0,0,0)
23640 print "エンターキー:トップ画面へ行く"+chr$(13)
23650 print "S or s:データー保存"+chr$(13)
23660 key$=input$(1)
23670 if key$=chr$(13) then goto Main_Screen:
23680 '2.プロフィール性別女性の場合　ここまで
23690 'endfunc result$
23700 '取扱説明書
23710 '相性占い　トップメニュー ここから
23720 'グラフィック ここから
23730 Anzai_Aisyou_Top:
23740 cls 3:
23750 line(0,0)-(1100,60),rgb(0,0,255),bf
23760 pen 5:line(0,0)-(1103,63),rgb(255,255,255),b
23770 line(0,60)-(1100,450),rgb(127,255,212),bf
23780 pen 5:line(0,63)-(1103,453),rgb(255,0,255),b
23790 line(0,450)-(1100,650),rgb(0,255,0),bf
23800 pen 5:line(0,453)-(1103,653),rgb(0,0,0),b
23810 'グラフィック　ここまで
23820 color rgb(255,255,255)
23830 print"安斎流姓名判断 　相性占い トップメニュー"+chr$(13)
23840 color rgb(255,0,255)
23850 print"1.自分と異性の相性"+chr$(13)
23860 print"2.男女の相性"+chr$(13)
23870 print"3.前の画面に戻る"+chr$(13)
23880 print"4.トップ画面に戻る"+chr$(13)
23890 color rgb(0,0,0)
23900 print"番号を選んでください:"+chr$(13)
23910 Input"番号:",key
23920 if key=1 then goto Anzai_Result_Aisyou_male_female:
23930 if key=2 then s2=2:goto Anzai_Aisyou2:
23940 if key=3 then goto Menu1_2_Anzai_Top:
23950 if key=4 then goto Main_Screen:
23960 if key>4 or key=0  then goto Anzai_Aisyou_Top:
23970 'グラフィック領域　ここから
23980 cls 3:line(0,0)-(1150,60),rgb(0,0,255),bf
23990 line(0,60)-(1150,180),rgb(127,255,212),bf
24000 line(0,120)-(1150,200),rgb(0,255,0),bf
24010 'グラフィック領域　ここまで
24020 '誕生日入力　生まれた年
24030 color rgb(255,255,255)
24040 print"誕生日入力　生まれた年"+chr$(13)
24050 COLOR rgb(255,0,255)
24060 print"生まれた年を入れてください"+chr$(13)
24070 color rgb(0,0,0)
24080 Input"生まれた年:",year
24090 '誕生日入力 生まれた月
24100 cls
24110 color rgb(255,255,255)
24120 print"誕生日入力 生まれた月"+chr$(13)
24130 color rgb(255,0,255)
24140 print"生まれた月を入力してください"+chr$(13)
24150 color rgb(0,0,0)
24160 Input"生まれた月:",month
24170 '誕生日入力 生まれた日を入力
24180 cls
24190 color rgb(255,255,255)
24200 print"誕生日入力 生まれた日入力"+chr$(13)
24210 color rgb(255,0,255)
24220 print"生まれた日を入力してください"+chr$(13)
24230 color rgb(0,0,0)
24240 Input"生まれた日:",day
24250 '人生の転機を見る
24260 'グラフィック領域　ここから
24270 cls 3
24280 line(0,0)-(1150,60),rgb(0,0,255),bf
24290 line(0,60)-(1150,470),rgb(127,255,212),bf
24300 line(0,470)-(1150,520),rgb(0,255,0),bf
24310 'グラフィック描画領域  ここまで
24320 cls
24330 color rgb(255,255,255)
24340 print"人生の転機を見る"+chr$(13)
24350 color rgb(255,0,255)
24360 buf_total2=buf_total-(fix(buf_total/10)*10)
24370 print"誕生日";year;"年";month;"月";day;"日"+chr$(13)
24380 print year+buf_total2;"年";buf_total2;"歳"+chr$(13)
24390 print year+buf_total2+5;"年";buf_total2+5;"歳"+chr$(13)
24400 Member_List_Top:
24410 cls 3
24420 line (0,0)-(950,60),rgb(0,0,255),bf
24430 pen 5:line(0,0)-(947,57),rgb(255,255,255),b
24440 line (0,60)-(950,460),rgb(127,255,212),bf
24450 pen 5:LINE(0,63)-(953,463),rgb(255,0,255),b
24460 line (0,463)-(950,640),rgb(0,255,0),bf
24470 pen 5:line(0,457)-(953,643),rgb(0,0,0),b
24480 color rgb(255,255,255)
24490 print "●メンバーリスト トップ"+chr$(13)
24500 color rgb(255,0,255)
24510 print "1.安斎流姓名判断　改名チェックリスト"+chr$(13)
24520 print "2.安斎流姓名判断 相性メンバーリスト"+chr$(13)
24530 print "3.九星姓名判断　陰陽配列"+chr$(13)
24540 print "4.トップ画面に行く"+chr$(13)
24550 color rgb(0,0,0)
24560 print "番号を選んでください"+chr$(13)
24570 Input "番号:",key
24580 if key=1 then goto Anzai_Rename_Entry_List:
24590 if key=2 then goto Anzai_Aisyou_Member_list_Top:
24600 if key=3 then goto Kyusei_Inyou_Array_List:
24610 if key=4 then goto Main_Screen:
24620 if key>4 or key=0 then goto Member_List_Top:
24630 '1.安斎流姓名判断改名リスト
24640 Anzai_Rename_Entry_List:
24650 if dir$("config/Anzai_Kikkyo/Anzai_Kikkyo_name_list.dat")="" then
24660 cls 3
24670 line (0,0)-(850,60),rgb(0,0,255),bf
24680 pen 5:line(0,0)-(853,63),rgb(255,255,255),b
24690 line (0,60)-(850,180),rgb(127,255,212),bf
24700 pen 5:line(0,63)-(853,183),rgb(255,0,255),b
24710 line (0,180)-(850,250),rgb(0,255,0),bf
24720 pen 5:line(0,183)-(853,253),rgb(0,0,0),b
24730 color rgb(255,255,255)
24740 cls :print"1.安斎流姓名判断改名リスト"+chr$(13)
24750 color rgb(255,0,255)
24760 print "登録データーは、ございません"+chr$(13)
24770 color rgb(0,0,0)
24780 print "エンターキーを押してください"+chr$(13)
24790 key$=Input$(1)
24800 if key$=chr$(13) then goto Main_Screen:
24810 else
24820 counts=0
24830 open "config/Anzai_Kikkyo/Anzai_Kikkyo_name_list.dat" for input as #2
24840 while eof(2) = 0
24850 line input #2,line$:counts = counts + 1
24860 wend
24870 close #2
24880 cls 3:
24890 line (0,0)-(900,60),rgb(0,0,255),bf
24900 pen 5:line(0,0)-(903,63),rgb(255,255,255),b
24910 line (0,60)-(900,180),rgb(127,255,212),bf
24920 pen 5:line(0,63)-(903,183),rgb(255,0,255),b
24930 line (0,180)-(900,250),rgb(0,255,0),bf
24940 pen 5:line(0,183)-(903,253),rgb(0,0,0),b
24950 color rgb(255,255,255)
24960 print "1.安斎流姓名判断改名リスト登録件数"+chr$(13)
24970 color rgb(255,0,255)
24980 print "登録件数:";counts;"件"+chr$(13)
24990 talk "登録件数は"+str$(counts)+"件です。"
25000 color rgb(0,0,0)
25010 print "エンターキーを押してください"+chr$(13)
25020 endif
25030 key$ = input$(1)
25040 if key$ = chr$(13) then goto Show_Entry_list:
25050 '
25060 '
25070 Show_Entry_list:
25080 open "config/Anzai_Kikkyo/Anzai_Kikkyo_name_list.dat" for input as #1
25090 for i=0 to 3 * counts - 1
25100 input #1,buf_lines$(i)
25110 next i
25120 close #1
25130 n=0:cls 3
25140 'グラフィック領域　ここから
25150 line (0,0)-(1300,60),rgb(0,0,255),bf
25160 pen 5:line(0,0)-(1303,63),rgb(255,255,255),b
25170 line (0,60)-(1300,100*counts+60),rgb(124,255,212),bf
25180 pen 5:line(0,63)-(1303,100*counts+60+3),rgb(255,0,255),b
25190 line (0,100*counts+60)-(1300,60+100*counts+120),rgb(0,255,0),bf
25200 pen 5:line(0,100*counts+60+3)-(1300,60+100*counts+120+3),rgb(0,0,0),b
25210 'グラフィック領域　ここまで
25220 color rgb(255,255,255)
25230 print "安斎流姓名判断　ネームリスト"+chr$(13)
25240 color rgb(255,0,255)
25250 'count:登録件数
25260 while n < counts
25270 font 16:print n+1 ; ".";buf_lines$(3*n+0) ; ",";buf_lines$(3*n+1);",";buf_lines$(3*n+2);chr$(13)
25280 n=n+1
25290 wend
25300 color rgb(0,0,0)
25310 print"エンターキーを押してください"+chr$(13)
25320 key$=INPUT$(1)
25330 if key$=chr$(13) then goto Main_Screen:
25340 Anzai_Aisyou_Member_list_Top:
25350 n=0
25360 if dir$("config/Mydata/my_fortune_list_male.dat")="" then
25370 goto Empty_member_list:
25380 else
25390 goto show_Aisyou_member_List:
25400 endif
25410 '
25420 show_Aisyou_member_List:
25430 'ファイルを読み込む 1.登録件数、登録データーを読み込む
25440 '1.ファイルがない時　ファイルがありませんと表示する
25450 if dir$("config/Mydata/my_fortune_list_male.dat") = " " then
25460 '1.ファイルがない時、ファイルがありませんと表示させる
25470 'グラフィック描画領域 ここから
25480 line (0,0)-(1200,60),rgb(0,0,255),bf
25490 line (0,60)-(1200,273),rgb(127,255,212),bf
25500 line (0,270)-(1200,500),rgb(0,255,0),bf
25510 'グラフィック描画領域　ここまで
25520 print "ファイルがありません" + chr$(13)
25530 else
25540 'n:ファイルを開いて、登録件数の確認
25550 open "config/Mydata/my_fortune_list_male.dat" for input as #1
25560 while eof(1) = 0
25570 line input #1,lines$:n=n+1
25580 'input #1,buffLines$(n)
25590 'n = n + 1
25600 wend
25610 close #1
25620 'ファイルを開いて、配列にデーターを入力する
25630 open "config/Mydata/my_fortune_list_male.dat" for input as #2
25640 for i=0 to n*2-2
25650 input #2,buffLines$(i)
25660 next i
25670 close #2
25680 'ファイル読み込み　ここまで
25690 N=0
25700 'グラフィック領域　ここから
25710 cls 3
25720 line (0,0)-(1200,60),rgb(0,0,255),bf
25730 pen 5:line (0,0)-(1203,63),rgb(255,255,255),b
25740 line (0,60)-(1200,160),rgb(127,255,212),bf
25750 pen 5:line (0,63)-(1203,163),rgb(255,0,255),b
25760 line (0,160)-(1200,250),rgb(0,255,0),bf
25770 pen 5:line(0,163)-(1203,253),rgb(0,0,0),b
25780 'グラフィック領域　ここまで
25790 color rgb(255,255,255)
25800 print "安斎流姓名判断　相性メンバーリスト 登録件数"+chr$(13)
25810 color rgb(255,0,255)
25820 print "登録件数:";n;"件"+chr$(13)
25830 color rgb(0,0,0)
25840 print "エンターキーを押してください"+chr$(13)
25850 key$=input$(1)
25860 if key$ = chr$(13) then goto Aisyou_List:
25870 endif
25880 '安斎流姓名判断　相性リスト　メンバー表示
25890 Aisyou_List:
25900 cls 3:
25910 line (0,0)-(1300,60),rgb(0,0,255),bf
25920 pen 5:line (0,0)-(1303,63),rgb(255,255,255),b
25930 line (0,60)-(1300,260),rgb(127,255,212),bf
25940 pen 5:line(0,63)-(1303,263),rgb(255,0,255),b
25950 line (0,260)-(1300,470),rgb(0,255,0),bf
25960 line (0,263)-(1303,473),rgb(0,0,0),b
25970 color rgb(255,255,255)
25980 print "安斎流姓名判断 相性メンバーリスト 登録件数";count+1;"件目"+chr$(13)
25990 while n > count - 1
26000 color rgb(255,0,255)
26010 print buffLines$(2*count+0)+chr$(13)
26020 print buffLines$(2*count+1)+chr$(13)
26030 color rgb(0,0,0)
26040 print "エンターキー:前の画面"+chr$(13)
26050 print "スペースキー:次のリストへ行く"+chr$(13)
26060 key$=input$(1)
26070 if key$=chr$(13) then goto Member_List_Top:
26080 if key$=" " then
26090 count= ((count + 1) Mod n)
26100 if n = count then ui_msg"データーが一杯です.":count = ((count + 1) Mod n)
26110 goto Aisyou_List:
26120 endif
26130 wend
26140 '空っぽのときの表示
26150 Empty_member_list:
26160 cls 3
26170 line(0,0)-(850,60),rgb(0,0,255),bf
26180 pen 5:line(0,0)-(853,183),rgb(255,255,255),b
26190 line(0,60)-(850,180),rgb(127,255,212),bf
26200 pen 5:line(0,63)-(853,183),rgb(255,0,255),b
26210 line (0,180)-(850,250),rgb(0,255,0),bf
26220 pen 5:line(0,183)-(853,253),rgb(0,0,0),b
26230 color rgb(255,255,255)
26240 print "安斎流姓名判断　相性メンバーリスト" + chr$(13)
26250 color rgb(255,0,255)
26260 print "登録メンバーはいません" + chr$(13)
26270 color rgb(0,0,0)
26280 print"エンターキーを押してください" + chr$(13)
26290 key$ = input$(1)
26300 if key$=chr$(13) then goto Main_Screen:
26310 Remove_MemberList:
26320 cls 3:
26330 line (0,0)-(1200,60),rgb(0,0,255),bf
26340 line (0,3)-(1197,57),rgb(255,255,255),b
26350 line (0,60)-(1202,362),rgb(127,255,212),bf
26360 line (0,57)-(1197,357),rgb(255,0,255),b
26370 line (0,357)-(1197,557),rgb(0,255,0),bf
26380 line(0,360)-(1200,560),rgb(0,0,0),b
26390 color rgb(255,255,255)
26400 print"メンバーリストの編集(安斎流姓名判断)" + chr$(13)
26410 color rgb(255,0,255)
26420 print "1.改名チェックリストの編集" + chr$(13)
26430 print "2.相性メンバーリストの編集" + chr$(13)
26440 print "3.トップ画面へ行く" + chr$(13)
26450 color rgb(0,0,0)
26460 print"番号を選んでください" + chr$(13)
26470 Input"番号:",No
26480 if No = 0 or No > 3 then goto Remove_MemberList:ui_msg "番号をもう一度、入れ直してください "
26490 if No=1 then
26500 If dir$("config/Anzai_Kikkyo/Anzai_Kikkyo_name_list.dat") = "" then
26510 ui_msg"そのファイルはありません":goto Remove_MemberList:
26520 else
26530 kill "config/Anzai_Kikkyo/Anzai_Kikkyo_name_list.dat":ui_msg"改名チェックリストを削除しました":goto Remove_MemberList:
26540 endif
26550 endif
26560 if No=2 then
26570 if dir$("config/Mydata/my_fortune_list_male.dat")="" then
26580 ui_msg"そのファイルはありません":goto Remove_MemberList:
26590 else
26600 kill "config/Mydata/my_fortune_list_male.dat":ui_msg"相性メンバーリストを削除しました":goto Remove_MemberList:
26610 endif
26620 endif
26630 if No=3 then goto Main_Screen:
26640 '九星姓名判断 1.陰陽配列の保存
26650 Save_Inyo_array:
26660 open "config/Inyo_list/Inyo_array.dat" for append as #1
26670 print #1,"名前:";name$ + name2$;",陰陽配列:";buffer$ + buffer2$
26680 close #1
26690 ui_msg "保存しました"
26700 '九星姓名判断 陰陽配列 List
26710 Kyusei_Inyou_Array_List:
26720 cls 3
26730 'グラフィック領域　ここから
26740 Line (0,0)-(1200,60),rgb(0,0,255),bf
26750 line (0,0)-(1197,57),rgb(255,255,255),b
26760 line (0,60)-(1203,273),rgb(127,255,212),bf
26770 line (0,63)-(1200,270),rgb(255,0,255),b
26780 line (0,270)-(1200,500),rgb(0,255,0),bf
26790 line (0,273)-(1203,503),rgb(0,0,0),b
26800 'グラフィック描画領域　ここまで
26810 'ファイル読み込み  ここから
26820 if dir$("config/Inyo_list/Inyo_array.dat")="" then
26830 mode=0
26840 else
26850 mode=1
26860 '登録件数を求める
26870 open "config/Inyo_list/Inyo_array.dat" for input as #1
26880 bcount=0
26890 while eof(1)=0
26900 line input #1,bufLine$:bcount = bcount + 1
26910 wend
26920 close #1
26930 open "config/Inyo_list/Inyo_array.dat" for input as #2
26940 for i=0 to 2 * bcount - 1
26950 input #2,count1$(i)
26960 next i
26970 close #2
26980 endif
26990 'ファイル読み込み  ここまで
27000 '1行目　文字色　白
27010 '1.ファイルがない時
27020 color rgb(255,255,255)
27030 print "九星姓名判断 陰陽配列　リスト" + chr$(13)
27040 if mode=0 then
27050 color rgb(255,0,255)
27060 print "ファイルがありません"+chr$(13)
27070 else
27080 '2.ファイルが有る時
27090 color rgb(255,0,255)
27100 'bcount:登録件数
27110 select case bcount
27120 '登録件数が一件のとき
27130 case 1:
27140 print count1$(0) + chr$(13)
27150 print count1$(1) + chr$(13)
27160 color rgb(0,0,0)
27170 print "エンターキー:トップへ行く" + chr$(13)
27180 key$ = input$(1)
27190 if key$ = chr$(13) then goto Main_Screen:
27200 '登録件数が2件以上の時
27210 case else:
27220 n = 0
27230 while (1)
27240 l=n mod bcount
27250 if l => 0 then
27260 '登録件数がn件のときの
27270 cls
27280 color rgb(255,255,255)
27290 print"九星姓名判断 陰陽配列 リスト"+chr$(13)
27300 color rgb(255,0,255)
27310 print count1$(2*l + 0) + chr$(13)
27320 'l = l + 1
27330 print count1$(2*l + 1) + chr$(13)
27340 print"スペースキー:次へ行く" + chr$(13)
27350 print"エンターキー:トップへ行く" + chr$(13)
27360 key$ = input$(1)
27370 if key$ = " " then n = (n + 1) Mod bcount
27380 if key$ = Chr$(13) then goto Main_Screen:
27390 endif
27400 wend
27410 end Select
27420 endif
27430 func get_chiunn(name2$)
27440 buff_name=len(name2$)
27450 '1.男性の地運を求める
27460 select case buff_name
27470 case 1:
27480 '男性の地運を求める
27490 buf_chiunn = char_count(name2$)
27500 case 2:
27510 '名が2文字
27520 if buff_name = 2  then
27530 buf_Input_name$(0) = mid$(name2$,1,1)
27540 buf_Input_name$(1) = mid$(name2$,2,1)
27550 '地運を計算
27560 buf_chiunn = char_count(buf_Input_name$(0)) + char_count(buf_Input_name$(1))
27570 endif
27580 case 3:
27590 '1.名３
27600 if  buff_name = 3 then
27610 buf_Input_name$(0) = Mid$(name2$,1,1)
27620 buf_Input_name$(1) = Mid$(name2$,2,1)
27630 buf_Input_name$(2) = Mid$(name2$,3,1)
27640 buf_chiunn=char_count(buf_Input_name$(0))+char_count(buf_Input_name$(1))+char_count(buf_Input_name$(2))
27650 endif
27660 case else:
27670 end select
27680 endfunc buf_chiunn
27690 func get_gaiunn(name3$,name4$)
27700 buff_name3 = len(name3$)
27710 buff_name4 = len(name4$)
27720 buff_wname = buff_name3 + buff_name4
27730 '2.女性　外運を求める
27740 select case buff_wname
27750 '姓と名の合計数
27760 case 2:
27770 buf_Input_name2$(0)=Mid$(name3$,1,1)
27780 buf_Input_name2$(1)=Mid$(name4$,1,1)
27790 buf_gaiunn=char_count(buf_Input_name2$(0)) + char_count(buf_Input_name2$(1))
27800 case 3:
27810 if buff_name3=2 and buff_name4=1 then
27820 buf_Input_name2$(0)=Mid$(name3$,1,1)
27830 buf_Input_name2$(1)=Mid$(name3$,2,1)
27840 buf_Input_name2$(2)=Mid$(name4$,1,1)
27850 buf_gaiunn=char_count(buf_Input_name2$(0))+char_count(buf_Input_name2$(2))
27860 endif
27870 if buff_name3=1 and buff_name4=2 then
27880 buf_Input_name2$(0)=Mid$(name3$,1,1)
27890 buf_Input_name2$(1)=Mid$(name4$,1,1)
27900 buf_Input_name2$(2)=Mid$(name4$,2,1)
27910 buf_gaiunn=char_count(buf_Input_name2$(0))+char_count(buf_Input_name2$(2))
27920 endif
27930 case 4:
27940 '姓１、名３
27950 if buff_name3=1 and buff_name4=3 then
27960 buf_Input_name2$(0)=Mid$(name3$,1,1)
27970 buf_Input_name2$(1)=Mid$(name4$,1,1)
27980 buf_Input_name2$(2)=Mid$(name4$,2,1)
27990 buf_Input_name2$(3)=Mid$(name4$,3,1)
28000 '外運を求める
28010 buf_gaiunn=char_count(buf_Input_name2$(0))+char_count(buf_Input_name2$(2))+char_count(buf_Input_name2$(3))
28020 endif
28030 '姓２,名２
28040 if buff_name3=2 and buff_name4=2 then
28050 buf_Input_name2$(0)=Mid$(name3$,1,1)
28060 buf_Input_name2$(1)=Mid$(name3$,2,1)
28070 buf_Input_name2$(2)=Mid$(name4$,1,1)
28080 buf_Input_name2$(3)=Mid$(name4$,2,1)
28090 '外運を求める
28100 buf_gaiunn=char_count(buf_Input_name2$(0))+char_count(buf_Input_name2$(3))
28110 endif
28120 '姓３，名１
28130 if buff_name3=3 and buff_name4=1 then
28140 buf_Input_name2$(0)=Mid$(name3$,1,1)
28150 buf_Input_name2$(1)=Mid$(name3$,2,1)
28160 buf_Input_name2$(2)=Mid$(name3$,3,1)
28170 buf_Input_name2$(3)=Mid$(name4$,1,1)
28180 '外運を求める
28190 buf_gaiunn=char_count(buf_Input_name2$(0))+char_count(buf_Input_name2$(1))+char_count(buf_Input_name2$(3))
28200 endif
28210 case 5:
28220 '姓 3,名2
28230 if buff_name3=3 and buff_name=2 then
28240 buf_Input_name2$(0)=Mid$(name3$,1,1)
28250 buf_Input_name2$(1)=Mid$(name3$,2,1)
28260 buf_Input_name2$(2)=Mid$(name3$,3,1)
28270 buf_Input_name2$(3)=Mid$(name4$,1,1)
28280 buf_Input_name2$(4)=Mid$(name4$,2,1)
28290 '外運を求める
28300 buf_gaiunn=char_count(buf_Input_name2$(0))+char_count(buf_Input_name2$(1))+char_count(buf_Input_name2$(4))
28310 endif
28320 '姓４、名１
28330 if buff_name3=4 and buff_name4=1 then
28340 buf_Input_name2$(0)=Mid$(name3$,1,1)
28350 buf_Input_name2$(1)=Mid$(name3$,2,1)
28360 buf_Input_name2$(2)=Mid$(name3$,3,1)
28370 buf_Input_name2$(3)=Mid$(name3$,4,1)
28380 buf_Input_name2$(4)=Mid$(name4$,1,1)
28390 '外運を求める
28400 buf_gaiunn=char_count(buf_Input_name2$(0))+char_count(buf_Input_name2$(1))+char_count(buf_Input_name$(4))
28410 endif
28420 '姓２、名３
28430 if buff_name3=2 and buff_name4=3 then
28440 buf_Input_name2$(0)=Mid$(name3$,1,1)
28450 buf_Input_name2$(1)=Mid$(name3$,2,1)
28460 buf_Input_name2$(2)=Mid$(name4$,1,1)
28470 buf_Input_name2$(3)=Mid$(name4$,2,1)
28480 buf_Input_name2$(4)=Mid$(name4$,3,1)
28490 '外運を求める
28500 buf_gaiunn=char_count(buf_Input_name$(0))+char_count(buf_Input_name$(3))+char_count(buf_Input_name$(4))
28510 endif
28520 case 6:
28530 '1.姓３，名３
28540 if buff_name3=3 and buff_name4=3 then
28550 buf_Input_name2$(0)=Mid$(name3$,1,1)
28560 buf_Input_name2$(1)=Mid$(name3$,2,1)
28570 buf_Input_name2$(2)=Mid$(name3$,3,1)
28580 buf_Input_name2$(3)=Mid$(name4$,1,1)
28590 buf_Input_name2$(4)=Mid$(name4$,2,1)
28600 buf_Input_name2$(5)=Mid$(name4$,3,1)
28610 '外運を求める
28620 buf_gaiunn=char_count(buf_Input_name2$(0))+char_count(buf_Input_name2$(1))+char_count(buf_Input_name2$(4))+char_count(buf_Input_name$(5))
28630 endif
28640 '2.姓４，名２
28650 if buff_name3=4 and buff_name4=2 then
28660 buf_Input_name2$(0)=Mid$(name3$,1,1)
28670 buf_Input_name2$(1)=Mid$(name3$,2,1)
28680 buf_Input_name2$(2)=Mid$(name3$,3,1)
28690 buf_Input_name2$(3)=Mid$(name3$,4,1)
28700 buf_Input_name2$(4)=Mid$(name4$,1,1)
28710 buf_Input_name2$(5)=Mid$(name4$,2,1)
28720 '外運を求める
28730 buf_gaiunn=char_count(buf_Input_name2$(0))+char_count(buf_Input_name2$(1))+char_count(buf_Input_name$(5))
28740 endif
28750 case 7:
28760 '1姓４，名３
28770 '外運を求める
28780 end select
28790 endfunc buf_gaiunn
