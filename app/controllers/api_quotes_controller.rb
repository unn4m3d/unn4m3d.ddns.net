class ApiQuotesController < ApplicationController
  def _search
    if ApiUser.where(token: params[:token]).size >= 1
      if params[:text] && params[:text].length > 3 && params[:cid]
        @quotes = Quote.where("text LIKE ?","%"+params[:text]+"%", cid: params[:cid], 'qid IS NOT NULL').page(params[:page] || 0)
        @error = nil
      else
        @error = "Too short pattern or no CID specified"
      end
    else
      @error = "Unauthorized"
    end
  end

  def _show
    if ApiUser.where(token: params[:token]).size >= 1
      if params[:cid]
        @count = Quote.where(cid : params[:cid]).size
        params[:id] ||= Random.rand(@count)
        @quotes = Quote.where(cid: params[:cid], qid: params[:id], 'qid IS NOT NULL')
        if @quotes.size > 0
          @quote = @quotes.first
        else
          @error = "No matching quotes"
        end
      else
        @error = "Please specify CID"
      end
    else
      @error = "Unauthorized"
    end
  end

  def _add
    if ApiUser.where(token: params[:token]).size >= 1
      if params[:cid] && params[:text] && params[:author]
        @quote = Quote.create(
          :text => params[:text],
          :author => params[:author],
          :cid => params[:cid],
          :qid => nil,
          :date => Time.now.strftime("%d/%m/%Y")
        )
      else
        @error = "Please specify CID, text and author"
      end
    else
      @error = "Unauthorized"
    end
  end

  def search
    begin
      _search
    rescue => e
      @error = e.to_s
    end
  end
  def add
    begin
      _add
    rescue => e
      @error = e.to_s
    end
  end
  def show
    begin
      _show
    rescue => e
      @error = e.to_s
    end
  end
end
