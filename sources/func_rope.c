.float moveDistance,distance;
.float count;
.entity ropeNext,ropePrev;
.vector spawnOrigin;
.float gravity;
void() func_rope_updateThink =
{
	local float fraction;
	local float vecPrevDistance;
	local float vecNextDistance;
	local float dist;
	local vector orgNext;
	local vector orgPrev;
	local vector vecNext;
	local vector vecPrev;
	local vector _solution;
	local entity node;
	local entity newNode;
	local float tension;
	local float tensionMult;

	fraction = (time - self.ltime);
	self.ltime = time;
	tensionMult = 0;
	node = self.ropeNext;
	while (node)
	{
		if (node.ropeNext)
		{
			orgNext = node.ropeNext.origin;
		}
		else
		{
			orgNext = node.spawnOrigin;
		}
		vecNextDistance = vlen((orgNext - node.origin));
		tensionMult = (tensionMult + vecNextDistance);
		node = node.ropeNext;
	}
	dprint("length: ");
	dprint(ftos(tensionMult));
	dprint(" preset length: ");
	dprint(ftos(self.distance));
	dprint("\n");
	tensionMult = (tensionMult / self.distance);
	if ((tensionMult < 0.1))
	{
		tensionMult = 0.1;
	}
	else
	{
		if ((tensionMult > 0.4))
		{
			tensionMult = 0.4;
		}
	}
	tension = (self.count * tensionMult);
	_solution = VEC_ORIGIN;
	setorigin(self.ropeNext, self.origin);
	node = self.ropeNext;
	while (node)
	{
		node.flags = (node.flags - (node.flags & FL_ONGROUND));
		if (node.ropeNext)
		{
			orgNext = node.ropeNext.origin;
		}
		else
		{
			orgNext = node.spawnOrigin;
		}
		vecNext = (orgNext - node.origin);
		orgPrev = node.ropePrev.origin;
		vecPrev = (orgPrev - node.origin);
		vecPrevDistance = vlen(vecPrev);
		vecNextDistance = vlen(vecNext);
		if ((node.movetype != MOVETYPE_NONE))
		{
			node.velocity = (node.velocity - (node.velocity * (0.5 * fraction)));
			vecPrev = normalize(vecPrev);
			vecNext = normalize(vecNext);
			node.velocity = (node.velocity + (vecPrev * (((vecPrevDistance * vecPrevDistance) * tension) * fraction)));
			node.velocity = (node.velocity + (vecNext * (((vecNextDistance * vecNextDistance) * tension) * fraction)));
			_solution = (_solution + node.velocity);
			if ((self.gravity == 1))
			{
				node.velocity = (node.velocity + (('0 0 -1' * 64) * fraction));
			}
			
			if ((vlen(node.velocity) > 512))
			{
				node.velocity = normalize(node.velocity);
				node.velocity = (node.velocity * 512);
			}
			
			if ((vlen(node.velocity) < 4))
			{
				node.velocity = normalize(node.velocity);
				node.velocity = (node.velocity * 4);
			}
			
		}
		node = node.ropeNext;
	}
	node = self.ropeNext;
	while (node)
	{
		if (node.ropeNext)
		{
			orgNext = (node.ropeNext.origin + (node.ropeNext.velocity * frametime));
		}
		else
		{
			orgNext = node.spawnOrigin;
		}
		vecNext = (orgNext - (node.origin + (node.velocity * frametime)));
		vecNextDistance = vlen(vecNext);
		node.angles = vectoangles(vecNext);
		node.frame = (ceil(vecNextDistance) - 1);
		if ((node.frame > 30))
		{
			node.frame = 30;
		}
		else
		{
			if ((node.frame < 0))
			{
				node.frame = 0;
			}
		}
		node = node.ropeNext;
	}
	self.think = func_rope_updateThink;
	//self.nextthink = (time + 0.0139);
	self.nextthink = (time + 0.0125);
};

void() func_rope_intializeRope =
{
	local entity node;
	local entity newNode;
	local float _count;
	local float _cnt;
	local float spawnInterval;
	local vector vec;

	self.goalentity = find(world, targetname, self.target);
	vec = (self.goalentity.origin - self.origin);
	if (!self.distance)
	{
		self.distance = vlen(vec);
	}
	self.count = ceil((self.distance / self.moveDistance));
	_count = self.count;
	_cnt = 0;
	spawnInterval = (vlen(vec) / _count);
	vec = normalize(vec);
	node = self;
	while ((_cnt < _count))
	{
		newNode = spawn();
		node.ropeNext = newNode;
		newNode.ropePrev = node;
		newNode.moveDistance = self.moveDistance;
		if ((_cnt == 0))
		{
			newNode.movetype = MOVETYPE_NONE;
		}
		else
		{
			newNode.movetype = MOVETYPE_FLY;
		}
		newNode.solid = SOLID_NOT;
		if ((_cnt == (_count - 1)))
		{
			newNode.spawnOrigin = self.goalentity.origin;
		}
		setmodel(newNode, "progs/rope.mdl");
		setsize(newNode, VEC_ORIGIN, VEC_ORIGIN);
		setorigin(newNode, (self.origin + ((vec * spawnInterval) * _cnt)));
		newNode.angles = vectoangles(vec);
		node = node.ropeNext;
		_cnt = (_cnt + 1);
	}
	self.think = func_rope_updateThink;
	self.nextthink = time;
	self.ltime = time;
};

void() func_rope_use =
{
	self.gravity = (1 - self.gravity);
};
void() func_rope_point =
{

}
void() func_rope =
{
	precache_model("progs/rope.mdl");
	if (!self.moveDistance)
	{
		self.moveDistance = 16;
	}
	self.gravity = 1;
	self.think = func_rope_intializeRope;
	self.nextthink = time;
};
