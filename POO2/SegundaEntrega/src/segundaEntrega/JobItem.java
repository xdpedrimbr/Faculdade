package segundaEntrega;

abstract class JobItem {
	  private int quantity;

	  protected JobItem(int quantity) {
	    this.quantity = quantity;
	  }
	  public int getTotalPrice() {
	    return quantity * getUnitPrice();
	  }
	  public int getQuantity() {
	    return quantity;
	  }
	  public abstract int getUnitPrice();
	}


