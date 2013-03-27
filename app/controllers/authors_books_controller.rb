class AuthorsBooksController < ApplicationController
  # GET /authors_books
  # GET /authors_books.json
  def index
    @authors_books = AuthorsBook.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @authors_books }
    end
  end

  # GET /authors_books/1
  # GET /authors_books/1.json
  def show
    @authors_book = AuthorsBook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @authors_book }
    end
  end

  # GET /authors_books/new
  # GET /authors_books/new.json
  def new
    @authors_book = AuthorsBook.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @authors_book }
    end
  end

  # GET /authors_books/1/edit
  def edit
    @authors_book = AuthorsBook.find(params[:id])
  end

  # POST /authors_books
  # POST /authors_books.json
  def create
    @authors_book = AuthorsBook.new(params[:authors_book])

    respond_to do |format|
      if @authors_book.save
        format.html { redirect_to @authors_book, notice: 'Authors book was successfully created.' }
        format.json { render json: @authors_book, status: :created, location: @authors_book }
      else
        format.html { render action: "new" }
        format.json { render json: @authors_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /authors_books/1
  # PUT /authors_books/1.json
  def update
    @authors_book = AuthorsBook.find(params[:id])

    respond_to do |format|
      if @authors_book.update_attributes(params[:authors_book])
        format.html { redirect_to @authors_book, notice: 'Authors book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @authors_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authors_books/1
  # DELETE /authors_books/1.json
  def destroy
    @authors_book = AuthorsBook.find(params[:id])
    @authors_book.destroy

    respond_to do |format|
      format.html { redirect_to authors_books_url }
      format.json { head :no_content }
    end
  end
end
