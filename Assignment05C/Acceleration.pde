public void accelerationBetweenPlanets(Planet p1, Planet p2) {
		
		float distance = p1.position.dist(p2.position);
		PVector diffV = PVector.sub(p2.position,p1.position);

		diffV.div(distance);
		diffV.mult(p1.mass);
		diffV.mult(p2.mass);
		diffV.mult(gravityConstant);
		diffV.div(distance);
		diffV.div(distance);
		
		p1.acceleration.add(diffV);
		p1.acceleration.mult(0.6f);
		
		p2.acceleration.sub(diffV);
		p2.acceleration.mult(0.6f);
}