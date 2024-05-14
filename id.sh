#!/bin/bash

# List of URLs
urls=(
    "https://www.meinbezirk.at/perg/c-freizeit/das-sind-wir-die-stadtkapelle-grein-an-der-donau_a6656211"
    "https://www.meinbezirk.at/grieskirchen-eferding/c-freizeit/das-sind-wir-die-trachtenkapelle-kallham_a6665205"
    "https://www.meinbezirk.at/ried/c-freizeit/das-sind-wir-der-musikverein-pattigham_a6665076"
    "https://www.meinbezirk.at/voecklabruck/c-freizeit/das-sind-wir-der-musikverein-niederthalheim_a6664953"
    "https://www.meinbezirk.at/steyr-steyr-land/c-freizeit/das-sind-wir-der-musikverein-laussa_a6655017"
    "https://www.meinbezirk.at/perg/c-freizeit/das-sind-wir-der-musikverein-katsdorf_a6665532"
    "https://www.meinbezirk.at/voecklabruck/c-freizeit/das-sind-wir-die-trachtenmusikkapelle-zell-am-moos_a6665670"
    "https://www.meinbezirk.at/steyr-steyr-land/c-freizeit/das-sind-wir-der-musikverein-schiedlberg_a6653787"
    "https://www.meinbezirk.at/schaerding/c-freizeit/das-sind-wir-die-musikkapelle-st-marienkirchen-bei-schaerding_a6665226"
    "https://www.meinbezirk.at/grieskirchen-eferding/c-freizeit/das-sind-wir-der-musikverein-st-agatha_a6665634"
    "https://www.meinbezirk.at/linz-land/c-freizeit/das-sind-wir-die-trachtenkapelle-traun-siebenbuerger_a6637977"
    "https://www.meinbezirk.at/urfahr-umgebung/c-freizeit/das-sind-wir-der-musikverein-eidenberg_a6631530"
    "https://www.meinbezirk.at/urfahr-umgebung/c-freizeit/das-sind-wir-die-ortsmusik-walding_a6665514"
    "https://www.meinbezirk.at/kirchdorf/c-freizeit/das-sind-wir-die-stadtkapelle-kirchdorf-an-der-krems_a6617235"
    "https://www.meinbezirk.at/ried/c-freizeit/das-sind-wir-die-bauernkapelle-eberschwang_a6637899"
    "https://www.meinbezirk.at/braunau/c-freizeit/das-sind-wir-die-trachtenmusikkapelle-mining_a6653241"
    "https://www.meinbezirk.at/steyr-steyr-land/c-freizeit/das-sind-wir-der-musikverein-hilbern_a6653559"
    "https://www.meinbezirk.at/voecklabruck/c-freizeit/das-sind-wir-die-musikkapelle-st-georgen-im-attergau_a6637680"
    "https://www.meinbezirk.at/grieskirchen-eferding/c-freizeit/das-sind-wir-der-musikverein-scharten_a6653670"
    "https://www.meinbezirk.at/linz-land/c-freizeit/das-sind-wir-die-trachtenkapelle-kirchberg-thening_a6665490"
    "https://www.meinbezirk.at/kirchdorf/c-freizeit/das-sind-wir-der-musikverein-leonstein_a6665163"
    "https://www.meinbezirk.at/salzkammergut/c-freizeit/das-sind-wir-der-musikverein-roitham-am-traunfall_a6655224"
    "https://www.meinbezirk.at/schaerding/c-freizeit/das-sind-wir-die-feuerwehrmusik-rainbach-im-innkreis_a6665466"
    "https://www.meinbezirk.at/steyr-steyr-land/c-freizeit/das-sind-wir-der-musikverein-kleinreifling_a6631746"
    "https://www.meinbezirk.at/wels-wels-land/c-freizeit/das-sind-wir-der-musikverein-eberstalzell_a6655392"
    "https://www.meinbezirk.at/schaerding/c-freizeit/das-sind-wir-der-musikverein-st-willibald_a6655587"
    "https://www.meinbezirk.at/salzkammergut/c-freizeit/das-sind-wir-die-stadtkapelle-gmunden_a6654024"
    "https://www.meinbezirk.at/schaerding/c-freizeit/das-sind-wir-der-musikverein-sigharting_a6638019"
    "https://www.meinbezirk.at/perg/c-freizeit/das-sind-wir-die-trachtenmusikkapelle-bad-kreuzen_a6665112"
    "https://www.meinbezirk.at/schaerding/c-freizeit/das-sind-wir-der-musikverein-brunnenthal_a6665565"
    "https://www.meinbezirk.at/voecklabruck/c-freizeit/das-sind-wir-die-bergknappenkapelle-kohlgrube_a6637935"
    "https://www.meinbezirk.at/braunau/c-freizeit/das-sind-wir-die-ortsmusikkapelle-maria-schmolln_a6638841"
    "https://www.meinbezirk.at/ried/c-freizeit/das-sind-wir-die-trachtenkapelle-schildorn_a6637212"
    "https://www.meinbezirk.at/ried/c-freizeit/das-sind-wir-der-musikverein-antiesenhofen-reichersberg_a6655086"
    "https://www.meinbezirk.at/wels-wels-land/c-freizeit/das-sind-wir-die-trachtenkapelle-thalheim-bei-wels_a6664875"
    "https://www.meinbezirk.at/urfahr-umgebung/c-freizeit/das-sind-wir-die-feuerwehrmusik-gramastetten_a6638748"
    "https://www.meinbezirk.at/freistadt/c-freizeit/das-sind-wir-die-musikkapelle-unterweitersdorf_a6654144"
    "https://www.meinbezirk.at/wels-wels-land/c-freizeit/das-sind-wir-der-musikverein-steinhaus-bei-wels_a6639021"
    "https://www.meinbezirk.at/rohrbach/c-freizeit/das-sind-wir-die-buergerkorpskapelle-hofkirchen-im-muehlkreis_a6655728"
    "https://www.meinbezirk.at/braunau/c-freizeit/das-sind-wir-die-musikkapelle-feldkirchen-bei-mattighofen_a6655536"
    "https://www.meinbezirk.at/perg/c-freizeit/das-sind-wir-die-marktmusikkapelle-ried-in-der-riedmark_a6665322"
    "https://www.meinbezirk.at/urfahr-umgebung/c-freizeit/das-sind-wir-der-musikverein-vorderweissenbach_a6631497"
    "https://www.meinbezirk.at/perg/c-freizeit/das-sind-wir-die-marktmusik-st-georgen-an-der-gusen_a6631698"
    "https://www.meinbezirk.at/salzkammergut/c-freizeit/das-sind-wir-die-ortsmusik-traunkirchen_a6654111"
)

# Loop through each URL
for url in "${urls[@]}"; do
    # Execute curl and grep command
    result=$(curl "$url" 2>/dev/null | grep -Po "<div.*data-itemid='\K[[:digit:]]*")
    echo "$result"
done

