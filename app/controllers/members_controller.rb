class MembersController < ApplicationController
  # GET /members/1
  # GET /members/1.xml
  def show
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @member }
    end
  end

    # GET /members/new
  # GET /members/new.xml
  def new
    if params[:permalink]
      @parent = Member.find_by_permalink(params[:permalink]) if params[:permalink]
      @parent.update_attribute(:clicks, @parent.clicks.to_i+1)
      @member = @parent.members.build
    else
      @member = Member.new
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @member }
    end
  end

  # POST /members
  # POST /members.xml
  def create
    @member = Member.new(params[:member])

    respond_to do |format|
      if @member.save
        format.html { redirect_to(@member, :notice => 'Member was successfully created.') }
        format.xml  { render :xml => @member, :status => :created, :location => @member }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }
      end
    end
  end
end
