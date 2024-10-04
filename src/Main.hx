class Main {
	public static var fixedCost:Int = 249000;
	public static var monthly_expenses = 60000;
	public static var salePrice:Float = 27.95;
	public static var cost_1000:Float = 35;
	public static var cost_2000:Float = 18;
	public static var cost_3000:Float = 20;

	public static var monthly_contracted_amt:Int = 200000;
	public static var monthly_contracted_cost:Float = 21.95;
	
	public static var amountNeeded:Int = 80000;

	public static var totalIncome:Float = 0;
	public static var unitSold:Int = 0;
	public static var revenue:Float = 0;
	public static var cost:Float = fixedCost;

	public static var brokeEven:Bool = false;
	public static var brokeEvenAmt:Int = 0;

	public static var months = [
		"January",
		"Feburary",
		"March",
		"April",
		"May",
		"June",
		"July",
		"August",
		"September",
		"October",
		"November",
		"December"
	];

	static function main() {
		for (month in months) {
			simulateMonth(month);
		}

		totalIncome = (revenue - cost);

		trace('\n$cost <- COST\n$revenue <- REVENUE\n$unitSold <- UNITS SOLD\n$totalIncome <- INCOME\n\nBROKE EVEN AT $brokeEvenAmt UNITS SOLD');
	}

	public static function simulateMonth(month: String) {
		cost += monthly_expenses;
		buyMonthlyUnits(month);
	}

	public static function buyMonthlyUnits(month: String) {
		trace('purchasing units for $month');
		for (i in 0...monthly_contracted_amt) {
			unitSold++;
			revenue += monthly_contracted_cost;
			if (i <= 2000) {
				cost += 40;
			} else if (i > 2000 && i <= 3000) {
				cost += 22.50;
			} else if (i > 3000) {
				cost += 19;
			}

			totalIncome = (revenue - cost);

			if (totalIncome >= 0 && brokeEven == false) {
				brokeEven = true;
				brokeEvenAmt = unitSold;
			}
		}
	}

	public static function partOne() {
		while (totalIncome < amountNeeded) {
			buyUnit();

			if (cost < revenue && brokeEven == false) {
				brokeEven = true;
				trace('broke even at $unitSold units sold ($revenue revenue made)');
			}
		}

		trace('made $amountNeeded with $unitSold ($totalIncome income made)');
	}

	public static function buyUnit() {
		unitSold++;
		revenue += salePrice;

		if (unitSold <= 1000) {
			cost += cost_1000;
		} else if (unitSold > 1000 && unitSold <= 3000) {
			cost += cost_2000;
		} else if (unitSold > 3000) {
			cost += cost_3000;
		} else {
			trace("something screwed up somewhere");
		}

		totalIncome = (revenue - cost);
	}
}
