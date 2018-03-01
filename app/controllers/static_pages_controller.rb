class StaticPagesController < ApplicationController
  def utils
  end
  
  def notam
    #render '/Notam.pdf'
    # Open browser and go to trainline website
    $browser = Watir::Browser.new :chrome
    $browser.goto "http://notamweb.aviation-civile.gouv.fr/Script/IHM/Bul_Aerodrome.php"
    $browser.text_field(:name => 'AERO_Duree').set "24"
    $browser.send_keys :tab
    $browser.send_keys :arrow_right
    $browser.send_keys :arrow_right
    $browser.text_field(:name => 'AERO_Tab_Aero[0]').set "LFLO"
    $browser.text_field(:name => 'AERO_Tab_Aero[1]').set "LFHY"
    $browser.text_field(:name => 'AERO_Tab_Aero[2]').set "LFLN"
    $browser.text_field(:name => 'AERO_Tab_Aero[3]').set "LFJU"
    $browser.text_field(:name => 'AERO_Tab_Aero[4]').set "LFLV"
    $browser.text_field(:name => 'AERO_Tab_Aero[5]').set "LFHP"
    $browser.text_field(:name => 'AERO_Tab_Aero[6]').set "LFLZ"
    $browser.button(:value => 'Complet').click
    $browser.a(:title => 'Impression du résultat tel qu\'il est affiché à l\'écran.').click
    sleep 3
    $url = $browser.window(:index => 1).url
    $browser.close
    system('curl ' + $url + ' > public/Notam.pdf')
    redirect_to '/Notam.pdf'
  end
  
end
