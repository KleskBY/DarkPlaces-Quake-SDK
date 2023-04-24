/*
===========================================================================
Copyright (C) 1999-2005 Id Software, Inc.

This file is part of Quake III Arena source code.

Quake III Arena source code is free software; you can redistribute it
and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation; either version 2 of the License,
or (at your option) any later version.

Quake III Arena source code is distributed in the hope that it will be
useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Foobar; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
===========================================================================
*/
#ifndef __MATHLIB__
#define __MATHLIB__

// mathlib.h

#include <math.h>

#ifdef DOUBLEVEC_T
typedef double vec_t;
#else
typedef float vec_t;
#endif
typedef vec_t vec3_t[3];
typedef vec_t vec4_t[4];

typedef double vec_accu_t;
typedef vec_accu_t vec3_accu_t[3];
vec_accu_t VectorLengthAccu( const vec3_accu_t v );

// I have a feeling it may be safer to break these #define functions out into actual functions
// in order to avoid accidental loss of precision.  For example, say you call
// VectorScaleAccu(vec3_t, vec_t, vec3_accu_t).  The scale would take place in 32 bit land
// and the result would be cast to 64 bit, which would cause total loss of precision when
// scaling by a large factor.
//#define DotProductAccu(x, y) ((x)[0] * (y)[0] + (x)[1] * (y)[1] + (x)[2] * (y)[2])
//#define VectorSubtractAccu(a, b, c) ((c)[0] = (a)[0] - (b)[0], (c)[1] = (a)[1] - (b)[1], (c)[2] = (a)[2] - (b)[2])
//#define VectorAddAccu(a, b, c) ((c)[0] = (a)[0] + (b)[0], (c)[1] = (a)[1] + (b)[1], (c)[2] = (a)[2] + (b)[2])
//#define VectorCopyAccu(a, b) ((b)[0] = (a)[0], (b)[1] = (a)[1], (b)[2] = (a)[2])
//#define VectorScaleAccu(a, b, c) ((c)[0] = (b) * (a)[0], (c)[1] = (b) * (a)[1], (c)[2] = (b) * (a)[2])
//#define CrossProductAccu(a, b, c) ((c)[0] = (a)[1] * (b)[2] - (a)[2] * (b)[1], (c)[1] = (a)[2] * (b)[0] - (a)[0] * (b)[2], (c)[2] = (a)[0] * (b)[1] - (a)[1] * (b)[0])
//#define Q_rintAccu(in) ((vec_accu_t) floor(in + 0.5))

vec_accu_t DotProductAccu( const vec3_accu_t a, const vec3_accu_t b );
void VectorSubtractAccu( const vec3_accu_t a, const vec3_accu_t b, vec3_accu_t out );
void VectorAddAccu( const vec3_accu_t a, const vec3_accu_t b, vec3_accu_t out );
void VectorCopyAccu( const vec3_accu_t in, vec3_accu_t out );
void VectorScaleAccu( const vec3_accu_t in, vec_accu_t scaleFactor, vec3_accu_t out );
void CrossProductAccu( const vec3_accu_t a, const vec3_accu_t b, vec3_accu_t out );
vec_accu_t Q_rintAccu( vec_accu_t val );

void VectorCopyAccuToRegular( const vec3_accu_t in, vec3_t out );
void VectorCopyRegularToAccu( const vec3_t in, vec3_accu_t out );
vec_accu_t VectorNormalizeAccu( const vec3_accu_t in, vec3_accu_t out );

#define	SIDE_FRONT		0
#define	SIDE_ON			2
#define	SIDE_BACK		1
#define	SIDE_CROSS		-2

#define PITCH		0
#define YAW			1
#define ROLL		2

#define	Q_PI	3.14159265358979323846

#define DEG2RAD( a ) ( a * M_PI ) / 180.0F

#ifndef M_PI
#define M_PI		3.14159265358979323846  // matches value in gcc v2 math.h
#endif

extern vec3_t vec3_origin;

#define	EQUAL_EPSILON	0.001

qboolean VectorCompare(vec3_t v1, vec3_t v2);

#define DotProduct(x,y)			(x[0]*y[0]+x[1]*y[1]+x[2]*y[2])
#define VectorSubtract(a,b,c)	{c[0]=a[0]-b[0];c[1]=a[1]-b[1];c[2]=a[2]-b[2];}
#define VectorAdd(a,b,c)		{c[0]=a[0]+b[0];c[1]=a[1]+b[1];c[2]=a[2]+b[2];}
#define VectorCopy(a,b)			{b[0]=a[0];b[1]=a[1];b[2]=a[2];}
#define Vector4Copy(a,b)		{b[0]=a[0];b[1]=a[1];b[2]=a[2];b[3]=a[3];}
#define	VectorScale(v, s, o)	((o)[0]=(v)[0]*(s),(o)[1]=(v)[1]*(s),(o)[2]=(v)[2]*(s))
#define VectorClear(x)			{x[0] = x[1] = x[2] = 0;}
#define VectorNegate(x, y)		{y[0]=-x[0];y[1]=-x[1];y[2]=-x[2];}
#define	VectorMA(v, s, b, o)	((o)[0]=(v)[0]+(b)[0]*(s),(o)[1]=(v)[1]+(b)[1]*(s),(o)[2]=(v)[2]+(b)[2]*(s))

vec_t Q_rint(vec_t in);
vec_t _DotProduct(vec3_t v1, vec3_t v2);
void _VectorSubtract(vec3_t va, vec3_t vb, vec3_t out);
void _VectorAdd(vec3_t va, vec3_t vb, vec3_t out);
void _VectorCopy(vec3_t in, vec3_t out);
void _VectorScale(vec3_t v, vec_t scale, vec3_t out);
void _VectorMA(vec3_t va, double scale, vec3_t vb, vec3_t vc);
qboolean VectorIsOnAxis( vec3_t v );
double VectorLength(vec3_t v);
void CrossProduct(const vec3_t v1, const vec3_t v2, vec3_t cross);
vec_t VectorNormalize(vec3_t inout);
vec_t ColorNormalize(vec3_t in, vec3_t out);
vec_t VectorNormalize2(const vec3_t v, vec3_t out);
void VectorInverse(vec3_t v);

void ClearBounds(vec3_t mins, vec3_t maxs);
void AddPointToBounds(const vec3_t v, vec3_t mins, vec3_t maxs);

void AngleVectors(const vec3_t angles, vec3_t forward, vec3_t right,
                  vec3_t up);
void R_ConcatRotations(float in1[3][3], float in2[3][3], float out[3][3]);
void RotatePoint(vec3_t point, float matrix[3][3]);
void CreateRotationMatrix(vec3_t angles, float matrix[3][3]);

#endif
