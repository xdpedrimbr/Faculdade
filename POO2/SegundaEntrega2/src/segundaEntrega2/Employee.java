package segundaEntrega2;

class Employee extends Party {
	  private int annualCost;
	  private String id;

	  public Employee(String name, String id, int annualCost) {
	    super(name);
	    this.id = id;
	    this.annualCost = annualCost;
	  }
	  @Override public int getAnnualCost() {
	    return annualCost;
	  }
	  public String getId() {
	    return id;
	  }
	  @Override public int getHeadCount() {
	    return 1;
	  }
	}
