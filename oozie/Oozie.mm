<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1575254357049" ID="ID_1833188826" MODIFIED="1575425650123" STYLE="bubble">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Oozie
    </p>
  </body>
</html></richcontent>
<edge COLOR="#ff0066" STYLE="bezier" WIDTH="1"/>
<font NAME="SansSerif" SIZE="11"/>
<hook NAME="accessories/plugins/HierarchicalIcons.properties"/>
<node COLOR="#111111" CREATED="1575254488740" ID="ID_613088497" MODIFIED="1575425020369" POSITION="right" TEXT="install&#x5b89;&#x88c5;">
<edge COLOR="#ff0066" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1575424826852" FOLDED="true" ID="ID_1643054049" MODIFIED="1575456840360" POSITION="right" TEXT="&#x7b80;&#x4ecb;">
<edge COLOR="#ff0066"/>
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1575424835016" ID="ID_92287683" MODIFIED="1575425020368" TEXT="&#x57fa;&#x4e8e;&#x5de5;&#x4f5c;&#x6d41;&#x5f15;&#x64ce;&#x7684;&#x5f00;&#x6e90;&#x6846;&#x67b6;">
<edge COLOR="#ff0066"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1575424854026" ID="ID_1728051831" MODIFIED="1575425020368" TEXT="&#x8fd0;&#x884c;&#x5728;tomcat&#x5bb9;&#x5668;&#x4e2d;">
<edge COLOR="#ff0066"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1575424867792" ID="ID_919853901" MODIFIED="1575425020368" TEXT="&#x4f7f;&#x7528;&#x6570;&#x636e;&#x5e93;&#x5b58;&#x50a8;&#x5de5;&#x4f5c;&#x6d41;&#x5b9a;&#x4e49;&#x548c;&#x5b9e;&#x4f8b;">
<edge COLOR="#ff0066"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1575424887072" ID="ID_1906678412" MODIFIED="1575425654834" TEXT="&#x652f;&#x6301;&#x591a;&#x79cd;&#x7c7b;&#x578b;&#x7684;Hadoop&#x4f5c;&#x4e1a;&#x8c03;&#x5ea6; ">
<edge COLOR="#ff0066"/>
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1575425486621" ID="ID_1184560730" MODIFIED="1575425642397" TEXT="jobs">
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1575425489597" ID="ID_987085508" MODIFIED="1575425550120" TEXT="Java job"/>
<node CREATED="1575425498069" ID="ID_224491685" MODIFIED="1575425675289" TEXT="Spark(Streaming) job"/>
<node CREATED="1575425502534" ID="ID_1991110537" MODIFIED="1575425550120" TEXT="MapReduce job"/>
<node CREATED="1575425511301" ID="ID_436495447" MODIFIED="1575425681002" TEXT="Hive job"/>
<node CREATED="1575425727341" ID="ID_1718752364" MODIFIED="1575425731570" TEXT="Shell job"/>
</node>
</node>
<node CREATED="1575425776563" ID="ID_1356605598" MODIFIED="1575426176698" TEXT="&#x7ba1;&#x7406; Directed Acyclic Graph(DAG) &#x5373;&#x6709;&#x5411;&#x65e0;&#x73af;&#x56fe;&#x7684;&#x52a8;&#x4f5c;"/>
</node>
<node COLOR="#111111" CREATED="1575254490698" FOLDED="true" ID="ID_1409095140" MODIFIED="1575456838448" POSITION="right" TEXT="architecture&#x67b6;&#x6784;">
<edge COLOR="#ff0066" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1575428421461" FOLDED="true" ID="ID_1412464206" MODIFIED="1575440882515" TEXT="Console">
<node CREATED="1575440801755" ID="ID_26727595" MODIFIED="1575440824953" TEXT="&#x63d0;&#x4f9b;&#x5bf9;oozie&#x6d41;&#x7a0b;&#x7684;&#x67e5;&#x770b;&#x548c;&#x76d1;&#x63a7;&#x529f;&#x80fd;"/>
</node>
<node CREATED="1575440828107" ID="ID_1427182997" MODIFIED="1575440851144" TEXT="Client">
<node CREATED="1575440939364" ID="ID_1029025969" MODIFIED="1575441012960" TEXT="&#x901a;&#x8fc7;&#x63a5;&#x53e3;&#x63a7;&#x5236;workflow&#x6d41;&#x7a0b;&#xff0c;&#x53ef;&#x4ee5;&#x6267;&#x884c;&#x63d0;&#x4ea4;&#x6d41;&#x7a0b;&#xff0c;&#x542f;&#x52a8;&#x6d41;&#x7a0b;&#xff0c;&#x8fd0;&#x884c;&#x6d41;&#x7a0b;&#xff0c;&#x79cd;&#x690d;&#x6d41;&#x7a0b;&#xff0c;&#x56de;&#x590d;&#x6d41;&#x7a0b;&#x7b49;"/>
</node>
<node CREATED="1575440851595" ID="ID_410575321" MODIFIED="1575440856344" TEXT="SDK">
<node CREATED="1575441015291" ID="ID_1411590109" MODIFIED="1575441116585" TEXT="Software DevelopmentKit"/>
</node>
<node CREATED="1575440857067" ID="ID_617088423" MODIFIED="1575440892065" TEXT="DB">
<node CREATED="1575441118083" ID="ID_702664155" MODIFIED="1575441143720" TEXT="&#x6570;&#x636e;&#x5e93;&#xff0c;&#x9ed8;&#x8ba4;Derby&#xff0c;&#x4e00;&#x822c; &#x4fee;&#x6539;&#x4e3a;mysql&#x4f7f;&#x7528;"/>
</node>
<node CREATED="1575440892611" ID="ID_35122445" MODIFIED="1575440898873" TEXT="webapp">
<node CREATED="1575441202916" ID="ID_760513789" MODIFIED="1575441255432" TEXT="oozie server &#x4f7f;&#x7528;&#x5185;&#x7f6e;&#x7684;tomcat&#x5bb9;&#x5668;&#xff0c;&#x53ef;&#x4ee5;&#x4f7f;&#x7528;&#x5916;&#x90e8;&#x7684;&#xff0c;&#x8bb0;&#x5f55;&#x7684;&#x4fe1;&#x606f;&#x5982;&#x65e5;&#x5fd7;&#x7b49;&#x653e;&#x5728;&#x6570;&#x636e;&#x5e93;"/>
</node>
<node CREATED="1575440899603" ID="ID_1519536080" MODIFIED="1575440931936" TEXT="Tomcat">
<node CREATED="1575441257403" ID="ID_1042777366" MODIFIED="1575441309809" TEXT="~~"/>
</node>
<node CREATED="1575440932723" ID="ID_1711131411" MODIFIED="1575440936913" TEXT="HD&#x7ec4;&#x4ef6;">
<node CREATED="1575441312091" ID="ID_1514633151" MODIFIED="1575441393487" TEXT="&#x5e95;&#x5c42;&#x6267;&#x884c;oozie&#x7f16;&#x6392;&#x6d41;&#x7a0b;&#x7684;&#x5404;&#x4e2a;&#x7ec4;&#x4ef6;&#xff0c;&#x5305;&#x62ec;MapReduce&#x3001;Hive&#x7b49;"/>
</node>
</node>
<node COLOR="#111111" CREATED="1575254562651" FOLDED="true" ID="ID_1753244279" MODIFIED="1575456839515" POSITION="right" TEXT="components&#x7ec4;&#x4ef6;">
<edge COLOR="#ff0066" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1575441394891" ID="ID_255136751" MODIFIED="1575441403791" TEXT="workflow definition"/>
<node CREATED="1575441405211" ID="ID_695191248" MODIFIED="1575441411768" TEXT="property file"/>
<node CREATED="1575441412459" ID="ID_751125062" MODIFIED="1575441420311" TEXT="libraries"/>
<node CREATED="1575441420762" ID="ID_1421596569" MODIFIED="1575441428623" TEXT="coordinator">
<node CREATED="1575441490475" ID="ID_889776742" MODIFIED="1575441526349" TEXT="&#x53ef;&#x8bbe;&#x7f6e;&#x5b9a;&#x65f6;&#xff0c;"/>
</node>
<node CREATED="1575441429275" ID="ID_1468240281" MODIFIED="1575441432913" TEXT="bundle"/>
</node>
<node COLOR="#111111" CREATED="1575254503488" FOLDED="true" ID="ID_462350918" MODIFIED="1575457453336" POSITION="right" TEXT="&#x4f18;&#x7f3a;&#x70b9;">
<edge COLOR="#ff0066" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1575259254411" ID="ID_1472428992" MODIFIED="1575424934980" TEXT="pros&#x4f18;&#x70b9;">
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1575456843135" ID="ID_470905559" MODIFIED="1575456910536" TEXT="&#x5927;&#x7684;&#x793e;&#x533a;&#x652f;&#x6301;"/>
<node CREATED="1575456911202" ID="ID_307422006" MODIFIED="1575456979003" TEXT="&#x53ef;&#x96c6;&#x6210;HUE&#xff0c;Cloudera Manager&#xff0c;Aapache Ambari"/>
<node CREATED="1575456985266" ID="ID_1849725034" MODIFIED="1575457045763" TEXT="HCatalog&#x6574;&#x5408;"/>
<node CREATED="1575457076577" ID="ID_928062459" MODIFIED="1575457134534" TEXT="SLA &#x901a;&#x77e5;"/>
<node CREATED="1575457134770" ID="ID_1627121850" MODIFIED="1575457180096" TEXT="&#x751f;&#x6001;&#x5708;&#x652f;&#x6301;&#xff1a;Pig&#x3001;Hive&#x3001;Sqoop&#x3001;etc"/>
<node CREATED="1575457180346" ID="ID_1985663014" MODIFIED="1575457196057" TEXT="&#x975e;&#x5e38;&#x8be6;&#x7ec6;&#x7684;&#x5e2e;&#x52a9;&#x6587;&#x6863;"/>
<node CREATED="1575457212362" ID="ID_175150346" MODIFIED="1575457278880" TEXT="launcher jobs as map tasks"/>
</node>
<node CREATED="1575259258887" ID="ID_428449022" MODIFIED="1575424934980" TEXT="cons&#x7f3a;&#x70b9;">
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1575457289163" ID="ID_1933598461" MODIFIED="1575457300895" TEXT="launcher jobs as map tasks"/>
<node CREATED="1575457301185" ID="ID_933858959" MODIFIED="1575457319063" TEXT="UI &#x4ec5;&#x652f;&#x6301;HUE&#x3001;oozie-web"/>
<node CREATED="1575457319409" ID="ID_1860248664" MODIFIED="1575457397287" TEXT="&#x590d;&#x6742;&#x6df7;&#x4e71;&#x7684;&#x5bf9;&#x8c61;&#x6a21;&#x578b;&#xff1a;bundler&#xff0c;coordinators&#xff0c;workflows"/>
<node CREATED="1575457397817" ID="ID_423019544" MODIFIED="1575457422958" TEXT="&#x66f4;&#x65b0; - extjs&#xff0c;hadoop proxy user&#xff0c;RDBMS&#x201c;"/>
<node CREATED="1575457424850" ID="ID_778411140" MODIFIED="1575457436118" TEXT="&#x5fc5;&#x987b;&#x7528;XML"/>
</node>
</node>
<node COLOR="#111111" CREATED="1575254493384" ID="ID_1064264554" MODIFIED="1575457455845" POSITION="right" TEXT="workflow&#x5de5;&#x4f5c;&#x6d41;&#x7a0b;">
<edge COLOR="#ff0066" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1575254637701" ID="ID_740554440" MODIFIED="1575424934980" TEXT="&#x5b9a;&#x4e49;">
<edge COLOR="#111111" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1575450555616" ID="ID_1668735701" MODIFIED="1575450688254" TEXT="hPDL&#x7f16;&#x5199;&#xff08;&#x4e00;&#x79cd;XML&#x6d41;&#x7a0b;&#x5b9a;&#x4e49;&#x8bed;&#x8a00;&#xff0c;&#x7c7b;&#x4f3c;&#x4e8e;JBPM&#xff09;"/>
<node CREATED="1575450690352" ID="ID_1155088009" MODIFIED="1575451002021" TEXT="&#x5305;&#x62ec;action nodes&#x548c; control flow nodes">
<node CREATED="1575451008825" ID="ID_1203301930" MODIFIED="1575451037420" TEXT="action nodes">
<node CREATED="1575451621431" ID="ID_153623497" MODIFIED="1575451648648" TEXT="&#x6267;&#x884c;&#x4e00;&#x4e2a;&#x5de5;&#x4f5c;&#x6d41;&#x7684;&#x4e00;&#x4e9b;&#x4efb;&#x52a1;"/>
<node CREATED="1575451414255" ID="ID_106354492" MODIFIED="1575451572449" TEXT="&#x53ef;&#x6269;&#x5c55;&#xff0c;&#x652f;&#x6301;&#x591a;&#x79cd;actions"/>
</node>
<node CREATED="1575451372240" ID="ID_1062231763" MODIFIED="1575451384208" TEXT="control flow nodes">
<node CREATED="1575451650719" ID="ID_1842056938" MODIFIED="1575451944497" TEXT="&#x63a7;&#x5236;&#x4e00;&#x4e2a;&#x5de5;&#x4f5c;&#x6d41;&#x7684;&#x5404;&#x52a8;&#x4f5c;&#x4e4b;&#x95f4;&#x7684;&#x6267;&#x884c;"/>
<node CREATED="1575451038967" ID="ID_893154741" MODIFIED="1575451092204" TEXT="start&#x3001;end&#x3001;fail"/>
<node CREATED="1575451052695" ID="ID_23538778" MODIFIED="1575451117268" TEXT="decision&#x3001;fork&#x3001;join"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1575254751120" ID="ID_1066599657" MODIFIED="1575424934980" TEXT="&#x64cd;&#x4f5c;">
<edge COLOR="#111111" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#111111" CREATED="1575254833402" ID="ID_1744828224" MODIFIED="1575424934980" TEXT="&#x6982;&#x8ff0;">
<edge COLOR="#111111" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="10"/>
<node CREATED="1575457461738" ID="ID_1912326270" MODIFIED="1575457461738" TEXT=""/>
</node>
<node COLOR="#111111" CREATED="1575254836960" ID="ID_699018295" MODIFIED="1575424934980" TEXT="MapReduce action">
<edge COLOR="#111111" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="10"/>
</node>
<node COLOR="#111111" CREATED="1575254850104" ID="ID_402884070" MODIFIED="1575424934980" TEXT="FS(HDFS) Action">
<edge COLOR="#111111" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="10"/>
</node>
<node COLOR="#111111" CREATED="1575254864808" ID="ID_1500782907" MODIFIED="1575424934980" TEXT="JAVA Action">
<edge COLOR="#111111" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="10"/>
</node>
<node COLOR="#111111" CREATED="1575254887921" ID="ID_1976828834" MODIFIED="1575424934980" TEXT="Shell Action">
<edge COLOR="#111111" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="10"/>
</node>
<node COLOR="#111111" CREATED="1575254897257" ID="ID_1343271208" MODIFIED="1575424934980" TEXT="Hive Action">
<edge COLOR="#111111" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="10"/>
</node>
<node COLOR="#111111" CREATED="1575254905032" ID="ID_679564465" MODIFIED="1575424934980" TEXT="Hive2 Action">
<edge COLOR="#111111" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="10"/>
</node>
<node COLOR="#111111" CREATED="1575254915825" ID="ID_800275299" MODIFIED="1575424934980" TEXT="DISCP Action">
<edge COLOR="#111111" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="10"/>
</node>
<node COLOR="#111111" CREATED="1575254924650" ID="ID_1681281238" MODIFIED="1575424934980" TEXT="Spark Action">
<edge COLOR="#111111" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="10"/>
</node>
<node COLOR="#111111" CREATED="1575254934472" ID="ID_405985172" MODIFIED="1575424934980" TEXT="Sub-Workflow Action">
<edge COLOR="#111111" WIDTH="thin"/>
<font NAME="SansSerif" SIZE="10"/>
</node>
</node>
<node CREATED="1575258710535" FOLDED="true" ID="ID_1390596949" MODIFIED="1575450541272" TEXT="&#x72b6;&#x6001;&#x8f6c;&#x6362;">
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1575258729641" ID="ID_1054245002" MODIFIED="1575424934980">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="photo/image-20191202115310880.png" />
  </body>
</html></richcontent>
<edge STYLE="bezier"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
</node>
<node CREATED="1575259022560" ID="ID_107778723" MODIFIED="1575424934980" TEXT="&#x6d41;&#x7a0b;&#x63a7;&#x5236;">
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1575259029105" ID="ID_1633166836" MODIFIED="1575424934979" TEXT="Start">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1575259032791" ID="ID_1462397854" MODIFIED="1575424934979" TEXT="End">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1575259036167" ID="ID_1003103426" MODIFIED="1575424934979" TEXT="Kill">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1575259057120" ID="ID_553226265" MODIFIED="1575424934979" TEXT="Decision">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1575259062655" ID="ID_1029672293" MODIFIED="1575424934979" TEXT="Fork &amp; Join">
<font NAME="SansSerif" SIZE="12"/>
</node>
</node>
<node CREATED="1575259092039" ID="ID_103517748" MODIFIED="1575424934979" TEXT="&#x5de5;&#x4f5c;&#x6d41;&#x7a0b;&#x5e94;&#x7528;">
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1575259137890" ID="ID_1290412520" MODIFIED="1575424934979" TEXT="deployment &amp; Execution &#x90e8;&#x7f72;&#x548c;&#x6267;&#x884c;">
<font NAME="SansSerif" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1575259174927" FOLDED="true" ID="ID_993590332" MODIFIED="1575425462649" POSITION="right" TEXT="coordinator &#x534f;&#x8c03;&#x5668;">
<edge COLOR="#ff0066"/>
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1575334083159" FOLDED="true" ID="ID_951962765" MODIFIED="1575425020361" TEXT="&#x5b9a;&#x4e49;&#x6982;&#x8ff0;">
<edge COLOR="#ff0066"/>
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1575334124376" ID="ID_861850914" MODIFIED="1575424934979" TEXT="">
<font NAME="SansSerif" SIZE="12"/>
</node>
</node>
<node CREATED="1575334176734" ID="ID_1990621322" MODIFIED="1575425020361" TEXT="&#x8be6;&#x60c5;">
<edge COLOR="#ff0066"/>
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1575334180758" ID="ID_1186887402" MODIFIED="1575425020361" TEXT="">
<edge COLOR="#ff0066"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
</node>
<node CREATED="1575334474117" ID="ID_884321135" MODIFIED="1575425020360" TEXT="&#x5e38;&#x7528;EL&#x51fd;&#x6570;">
<edge COLOR="#ff0066"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1575334481406" ID="ID_1833494216" MODIFIED="1575425020360" TEXT="&#x5e94;&#x7528;">
<edge COLOR="#ff0066"/>
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1575259137890" ID="ID_338473684" MODIFIED="1575425020360" TEXT="deployment &amp; Execution &#x90e8;&#x7f72;&#x548c;&#x6267;&#x884c;">
<edge COLOR="#ff0066"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1575334434822" FOLDED="true" ID="ID_666369795" MODIFIED="1575425020360" POSITION="right" TEXT="bundle &#x6346;">
<edge COLOR="#ff0066"/>
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1575334677614" ID="ID_1935970426" MODIFIED="1575424934978" TEXT="&#x6982;&#x5ff5;">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1575334787413" ID="ID_908173509" MODIFIED="1575424934978" TEXT="&#x5185;&#x5bb9;">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1575334796013" ID="ID_702853935" MODIFIED="1575424934978" TEXT="&#x5b9a;&#x4e49;">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1575334925150" ID="ID_1251223762" MODIFIED="1575424934978" TEXT="&#x5e38;&#x7528;&#x547d;&#x4ee4;">
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1575334993686" ID="ID_1884333795" MODIFIED="1575424934978" TEXT="oozie version">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1575335001031" ID="ID_387593878" MODIFIED="1575424934978" TEXT="">
<font NAME="SansSerif" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1575334951998" ID="ID_1825751324" MODIFIED="1575425020360" POSITION="right" TEXT="Web UI">
<edge COLOR="#ff0066"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1575334980678" ID="ID_1399747842" MODIFIED="1575425020359" POSITION="right" TEXT="HUE Oozie Editor">
<edge COLOR="#ff0066"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1575334925150" ID="ID_41655833" MODIFIED="1575425076489" POSITION="left" TEXT="&#x5e38;&#x7528;&#x547d;&#x4ee4;">
<edge COLOR="#ff0066"/>
<arrowlink DESTINATION="ID_41655833" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_1669376638" STARTARROW="None" STARTINCLINATION="0;0;"/>
<arrowlink DESTINATION="ID_41655833" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_127265423" STARTARROW="None" STARTINCLINATION="0;0;"/>
<linktarget COLOR="#b0b0b0" DESTINATION="ID_41655833" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_1669376638" SOURCE="ID_41655833" STARTARROW="None" STARTINCLINATION="0;0;"/>
<linktarget COLOR="#b0b0b0" DESTINATION="ID_41655833" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_127265423" SOURCE="ID_41655833" STARTARROW="None" STARTINCLINATION="0;0;"/>
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1575334993686" ID="ID_1374953394" MODIFIED="1575425020359" TEXT="oozie version">
<edge COLOR="#ff0066"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1575335001031" ID="ID_1024008439" MODIFIED="1575425020359" TEXT="oozie job -info">
<edge COLOR="#ff0066"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1575335302821" ID="ID_5510856" MODIFIED="1575425020358" TEXT="oozie job -kill">
<edge COLOR="#ff0066"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1575335309541" ID="ID_921870379" MODIFIED="1575425020358" TEXT="oozie job -log">
<edge COLOR="#ff0066"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1575335314757" ID="ID_1506497769" MODIFIED="1575425020358" TEXT="oozie job -run|submit|start">
<edge COLOR="#ff0066"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1575335335109" ID="ID_1397685028" MODIFIED="1575425020358" TEXT="oozie admin -status">
<edge COLOR="#ff0066"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1575335340757" ID="ID_564087042" MODIFIED="1575425020358" TEXT="oozie validate workflow.xml">
<edge COLOR="#ff0066"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
</node>
<node CREATED="1575335392812" ID="ID_926731506" MODIFIED="1575425020357" POSITION="left" TEXT="&#x4e00;&#x4e9b;&#x95ee;&#x9898;">
<edge COLOR="#ff0066"/>
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1575335402989" ID="ID_729592641" MODIFIED="1575425020357" TEXT="&#x6211;&#x4eec;&#x662f;&#x5426;&#x9700;&#x8981;&#x7528;oozie&#xff1f;">
<edge COLOR="#ff0066"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1575335433374" ID="ID_30891682" MODIFIED="1575425020357" TEXT="oozie&#x662f;&#x4ec0;&#x4e48;">
<edge COLOR="#ff0066"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1575335458221" ID="ID_860042533" MODIFIED="1575425020356" TEXT="">
<edge COLOR="#ff0066"/>
<font NAME="SansSerif" SIZE="12"/>
</node>
</node>
</node>
</map>
