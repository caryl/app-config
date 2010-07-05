class AppConfigsController < ApplicationController
  def index
    @app_configs = AppConfig.all(:order => 'kind_id, position')

    respond_to do |format|
      format.html
      #format.xml  { render :xml => @app_configs }
    end
  end

  def new
    @app_config = AppConfig.new

    respond_to do |format|
      format.html
      #format.xml  { render :xml => @app_config }
    end
  end

  def edit
    @app_config = AppConfig.find(params[:id])
  end

  def create
    @app_config = AppConfig.new(params[:app_config])

    respond_to do |format|
      if @app_config.save
        flash[:notice] = '配置项已创建.'
        format.html { redirect_to(system_app_configs_path) }
        #format.xml  { render :xml => @app_config, :status => :created, :location => @app_config }
      else
        format.html { render :action => "new" }
        #format.xml  { render :xml => @app_config.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @app_config = AppConfig.find(params[:id])

    respond_to do |format|
      if @app_config.update_attributes(params[:app_config])
        flash[:notice] = '配置项已更新.'
        format.html { redirect_to(system_app_configs_path) }
        #format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        #format.xml  { render :xml => @app_config.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @app_config = AppConfig.find(params[:id])
    @app_config.destroy

    respond_to do |format|
      format.html { redirect_to(system_app_configs_path) }
      #format.xml  { head :ok }
    end
  end
end
