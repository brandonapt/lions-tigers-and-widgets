class Main {
	public static var fixedCost:Int = 40000;
	public static var salePrice:Float = 27.95;
	public static var cost_1000:Float = 35;
	public static var cost_2000:Float = 18;
	public static var cost_3000:Float = 20;

	public static var amountNeeded:Int = 80000;

	public static var totalIncome:Float = 0;
	public static var unitSold:Int = 0;
	public static var revenue:Float = 0;
	public static var cost:Float = fixedCost;

	public static var brokeEven:Bool = false;

	static function main() {
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
