
class SportyClient
  def post(message)
    raise "Not signed in!" unless @user
    # post message to remote service
    puts "#{@user} posted message: #{message}"
  end

  def timeline
    raise "Not signed in!" unless @user
    # get timeline from remote service
    puts "#{@user} fetched timeline..."
  end

  def sign_in(user)
    # sign in to remote service
    @user = user
    puts "#{user} signed in."
  end

  def sign_out(user)
    # sign out of remote service
    puts "#{user} signed out!"
  end

  def as_signed_in_user(user)
    sign_in(user)
    begin
      yield
    ensure
      sign_out(user)
    end
  end
end

client = SportyClient.new
client.as_signed_in_user("broncos_fan") do
  client.post("Ready for the new season...")
  client.post("Broncos are going all the way!")
  client.timeline
end