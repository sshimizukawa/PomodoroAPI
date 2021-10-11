class MusicSessionsController < ApplicationController
  before_action :init

  def init
    @purpose = {
      WORKING: "working",
      RESTING: "resting",
    }

    @user_id = session[:user_id]
    @user = currentUser(@user_id)
  end

  def show
    working_music_links = MusicLink.where(user_id: @user_id, purpose: :working).order("priority asc").map { |ml| url_for(ml.music_file) }
    resting_music_links = MusicLink.where(user_id: @user_id, purpose: :resting).order("priority asc").map { |ml| url_for(ml.music_file) }

    music_sessions = MusicSession.where(user_id: @user_id).map { |ms|
      ms_links = []

      if ms[:purpose] == @purpose[:WORKING]
        ms_links = working_music_links
      elsif ms[:purpose] == @purpose[:RESTING]
        ms_links = resting_music_links
      end

      {
        length: ms.length,
        purpose: ms.purpose,
        priority: ms.priority,
        links: ms_links,
      }
    }

    response_success({ music_sessions: music_sessions })
  end

  def create
    # 想定されるリクエスト
    # working_musics: [file1, file2]
    # resting_musics: [file3, file4]
    # lengths: [100, 200, 300]

    # 入力値チェック
    param_working_musics = params.key?(:working_musics) ? params[:working_musics] : []
    param_resting_musics = params.key?(:resting_musics) ? params[:resting_musics] : []
    param_lengths = params.key?(:lengths) ? params[:lengths] : []

    if (param_working_musics.length <= 0 || param_resting_musics.length <= 0 || param_lengths.length <= 0)
      message = "次のパラメータを追加してください"

      if param_working_musics.length <= 0 then message += " / １つ以上のworking_musicを追加してください" end
      if param_resting_musics.length <= 0 then message += " / １つ以上のresting_musicを追加してください" end
      if param_lengths.length <= 0 then message += " / １つ以上のlengthを追加してください" end

      return response_bad_request(message)
    end

    @user.music_sessions.destroy_all
    @user.music_links do |music_link|
      music_link.music_file.purge
    end
    @user.music_links.destroy_all

    # save
    param_lengths.each_with_index do |length, index|
      music_session = MusicSession.new
      music_session.length = length
      music_session.purpose = index % 2 == 0 ? @purpose[:WORKING] : @purpose[:RESTING]
      music_session.priority = index
      music_session.user = @user
      music_session.save!
    end

    param_working_musics.each_with_index do |music, index|
      music_link = MusicLink.new
      music_link.music_file.attach(music)
      music_link.purpose = @purpose[:WORKING]
      music_link.priority = index
      music_link.user = @user
      music_link.save!
    end

    param_resting_musics.each_with_index do |music, index|
      music_link = MusicLink.new
      music_link.music_file.attach(music)
      music_link.purpose = @purpose[:RESTING]
      music_link.priority = index
      music_link.user = @user
      music_link.save!
    end

    return response_success()
  end
end
