package segundaEntrega;

public class Main {

	public static void main(String[] args) {
		Employee kent = new Employee(50);
		JobItem j1 = new LaborItem(5, kent);
		JobItem j2 = new PartsItem(15, 10);
		int total = j1.getTotalPrice() + j2.getTotalPrice();
	}

}
