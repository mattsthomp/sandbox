class ApplicationController < ActionController::Base

def loadGame
  f = File.open("test.xml")
  g = Nokogiri::XML(f)
  f.close
  e = g.css("event")
  e.each do |b|
    eid = b.attr("eventid")
    t = b.attr("tm")
    pl = b.attr("player_code")
    Event.create( eventid: eid, team: t, player: pl )
  end
  @counter = "1"
  render 'static_pages/help'
end
 
def loadPlays
  lastCount = params[:status].to_i
  @player1 = Event.find(lastCount).player
  @team1 = Event.find(lastCount).team
  @player2 = Event.find(lastCount + 1).player
  @team2 = Event.find(lastCount + 1).team
  @player3 = Event.find(lastCount + 2).player
  @team3 = Event.find(lastCount + 2).team
  @counter = (lastCount + 3).to_s
  render 'static_pages/help'
end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
