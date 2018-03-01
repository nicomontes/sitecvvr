class StaticPagesController < ApplicationController
  def utils
  end
  
  def notam
    system('export DISPLAY=:0 && ruby /home/nmontes/Code/notam/notam.rb')
    redirect_to '/Notam.pdf'
  end
  
end
