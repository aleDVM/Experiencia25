class SalesController < ApplicationController
  def new
    @sales = Sale.new
  end

def create
    @sale = Sale.new(sale_params) 
      
    if @sale.tax != 1
      @sale.total = (@sale.value - (@sale.value*@sale.discount/100))*1.19
    else
      @sale.total = @sale.value - (@sale.value*@sale.discount/100)
    end 
    
    if @sale.save
      redirect_to sales_done_path
    end
  end

  def done
    @sales = Sale.all
  end

  private

  def sale_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount, :tax, :total)
  end
end
