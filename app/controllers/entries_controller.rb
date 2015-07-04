class EntriesController < ApplicationController

  def index
    @directory = params[:directory] || 'content'
    @entries = Dir.entries("#{Rails.root}/public/#{@directory}").select {|x| !x.starts_with? '.' }
  end

  def show
  end

  def new
  end

  def new_dir
  end

  def edit
  end

  def renaming
  end

  def rename
    File.rename("#{Rails.root}/public/#{params[:directory]}/#{params[:filename]}", "#{Rails.root}/public/#{params[:directory]}/#{params[:new_filename]}")
    redirect_to '/entries', notice: 'Entry was successfully renamed.'
  end

  def create
    f=File.open("#{Rails.root}/public/#{params[:directory]}/#{params[:filename]}", 'w+')
    f.write(params[:content])
    f.close
    redirect_to '/entries', notice: 'Entry was successfully created.'
  end

  def create_dir
    Dir.mkdir("#{Rails.root}/public/#{params[:directory]}/#{params[:filename]}")
    redirect_to '/entries', notice: 'Entry was successfully created.'
  end

  def update
    puts params[:filename]
    f=File.open("#{Rails.root}/public/#{params[:directory]}/#{params[:filename]}", 'w')
    f.write(params[:content])
    f.close
    redirect_to '/entries', notice: 'Entry was successfully updated.'
  end

  def destroy
    if File::ftype("#{Rails.root}/public/#{params[:directory]}/#{params[:filename]}") == 'file'
      File.delete("#{Rails.root}/public/#{params[:directory]}/#{params[:filename]}")
    else
      Dir.rmdir("#{Rails.root}/public/#{params[:directory]}/#{params[:filename]}")
    end
    redirect_to '/entries', notice: 'Entry was successfully destroyed.'
  end

  def upload
    puts params[:content]
    File.open("#{Rails.root}/public/#{params[:directory]}/#{params[:filename]}", 'wb') do |file|
      file.write(params[:content].read)
    end
    redirect_to '/entries', notice: 'Entry was successfully uploaded.'
  end

  def build_site
    Bundler.with_clean_env do
      system "cd #{Rails.root}/public/content; jekyll build"
    end
    redirect_to '/entries', notice: 'Entry was successfully uploaded.'
  end

end
