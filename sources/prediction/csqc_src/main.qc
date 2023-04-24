
void CSQC_Init( float fAPILevel, string enginename, float fVersion ) {

}

void CSQC_Shutdown( void ) {
	
}

float CSQC_InputEvent( float flEventType, float flKey, float flCharacter, float fDeviceID ) {
	return FALSE;
}


vector vPlayerOrigin;
vector vPlayerVelocity;
vector vPlayerOriginOld;

void CSQC_UpdateView( float flWidth, float flHeight, float fNotMenu ) {
	clearscene();
	
	// Manipulate view, add entities here
	setproperty( VF_DRAWWORLD, TRUE );
	setproperty( VF_DRAWENGINESBAR, TRUE );
	setproperty( VF_DRAWCROSSHAIR, TRUE );
	
	addentities( ( intermission ? 0 : MASK_VIEWMODEL ) | MASK_ENGINE );
	
	setproperty( VF_ORIGIN, vPlayerOrigin + [ 0, 0, getstatf( STAT_VIEWHEIGHT ) ] );
	setproperty( VF_ANGLES, view_angles );
	
	renderscene();
	
	// Any 2D elements will be here
}

float CSQC_ConsoleCommand( string strCommand ) {
	return FALSE;
}

float Player_PreDraw( void ) {
    if ( self.entnum == player_localentnum ) {

        vector vOldOrigin;
		vector vOldVelocity;
		float fOldPMoveFlags;
		
		self.movetype = MOVETYPE_WALK;
		
		// Prepare rollback
		vOldOrigin = self.origin;
		vOldVelocity = self.velocity;
		fOldPMoveFlags = self.pmove_flags;

		// Apply physics for every single input-frame that has not yet been
		// acknowledged by the server (servercommandframe = last acknowledged frame)
		for ( int i = servercommandframe + 1; i <= clientcommandframe; i++ ) {
			float flSuccess = getinputstate( i );

			if ( flSuccess == FALSE ) {
				continue;
			}

			// Partial frames are the worst
			if (  input_timelength == 0 ) {
				break;
			}
			runstandardplayerphysics( self );
		}
				
		// Smooth stair stepping, this has to be done manually!
		vPlayerOriginOld = vPlayerOrigin;
				
		if ( ( self.flags & FL_ONGROUND ) && ( self.origin_z - vPlayerOriginOld_z > 0 ) ) {
			vPlayerOriginOld_z += frametime * 150;
					
			if ( vPlayerOriginOld_z > self.origin_z ) {
				vPlayerOriginOld_z = self.origin_z;
			}
			if ( self.origin_z - vPlayerOriginOld_z > 18 ) {
				vPlayerOriginOld_z = self.origin_z - 18;
			}
			vPlayerOrigin_z += vPlayerOriginOld_z - self.origin_z;
		} else {
			vPlayerOriginOld_z = self.origin_z;
		}
		
		vPlayerOrigin = [ self.origin_x, self.origin_y, vPlayerOriginOld_z ];
		vPlayerVelocity = self.velocity;
		
		addentity( self );

		// Time to roll back
		self.origin = vOldOrigin;
		setorigin( self, self.origin );
		self.velocity = vOldVelocity;
		self.pmove_flags = fOldPMoveFlags;
		self.movetype = MOVETYPE_NONE;

		// Set renderflag for mirrors!
		self.renderflags = RF_EXTERNALMODEL;
    } else {
        addentity( self );
    }
    
    return PREDRAW_NEXT;
}

void CSQC_Ent_Update( float flIsNew ) {
	float flEntType = readbyte();
	
	if ( flEntType == 1 ) {
		if ( flIsNew == TRUE ) {
			self.classname = "player";
			self.solid = SOLID_SLIDEBOX;
			self.predraw = Player_PreDraw;
			self.drawmask = MASK_ENGINE;
			setmodel( self, "progs/player.mdl" );
		}
			
		self.origin_x = readcoord();
		self.origin_y = readcoord();
		self.origin_z = readcoord();
		self.angles_x = readcoord();
		self.angles_y = readcoord();
		self.angles_z = readcoord();
		self.velocity_x = readshort();
		self.velocity_y = readshort();
		self.velocity_z = readshort();
		self.flags = readfloat();
			
		setsize( self, '-16 -16 -24', '16 16 32' );
		setorigin( self, self.origin );
	}
}
