# spec/requests/products_spec.rb
require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe 'GET /products' do
    it 'returns a successful response' do
      get '/products'
      expect(response).to be_successful
    end

    it 'assigns all products to @products' do
      product1 = Product.create(name: 'Product 1')
      product2 = Product.create(name: 'Product 2')

      get '/products'
      expect(assigns(:products)).to eq([product1, product2])
    end
  end

  describe 'GET /products/:id' do
    it 'returns a successful response' do
      product = Product.create(name: 'Product 1')

      get "/products/#{product.id}"
      expect(response).to be_successful
    end

    it 'assigns the requested product to @product' do
      product = Product.create(name: 'Product 1')

      get "/products/#{product.id}"
      expect(assigns(:product)).to eq(product)
    end
  end

  describe 'POST /products' do
    it 'creates a new product' do
      expect {
        post '/products', params: { product: { name: 'New Product' } }
      }.to change(Product, :count).by(1)
    end

    it 'redirects to the created product' do
      post '/products', params: { product: { name: 'New Product' } }
      expect(response).to redirect_to(Product.last)
    end
  end

  describe 'PATCH /products/:id' do
    it 'updates the product' do
      product = Product.create(name: 'Product 1')

      patch "/products/#{product.id}", params: { product: { name: 'Updated Product' } }
      product.reload

      expect(product.name).to eq('Updated Product')
    end

    it 'redirects to the updated product' do
      product = Product.create(name: 'Product 1')

      patch "/products/#{product.id}", params: { product: { name: 'Updated Product' } }
      expect(response).to redirect_to(product)
    end
  end

  describe 'DELETE /products/:id' do
    it 'destroys the product' do
      product = Product.create(name: 'Product 1')

      expect {
        delete "/products/#{product.id}"
      }.to change(Product, :count).by(-1)
    end

    it 'redirects to the products list' do
      product = Product.create(name: 'Product 1')

      delete "/products/#{product.id}"
      expect(response).to redirect_to(products_path)
    end
  end
end
