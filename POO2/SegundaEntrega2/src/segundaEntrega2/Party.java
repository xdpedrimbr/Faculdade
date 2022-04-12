package segundaEntrega2;

abstract class Party {
	  protected String name;

	  protected Party(String name) {
	    this.name = name;
	  }
	  public String getName() {
	    return name;
	  }
	  public abstract int getAnnualCost();
	  public abstract int getHeadCount();
	}