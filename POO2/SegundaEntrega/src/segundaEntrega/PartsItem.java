package segundaEntrega;

class PartsItem extends JobItem {
	  private int unitPrice;

	  public PartsItem(int quantity, int unitPrice) {
	    super(quantity);
	    this.unitPrice = unitPrice;
	  }
	  @Override public int getUnitPrice() {
	    return unitPrice;
	  }
}