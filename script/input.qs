#   ############################################
#   input file to program qsANNNI
#   simulator of quantum state of 1D ANNNI model
#   ############################################
#   reasonable values are strongly recommended
#   otherwise unexpected errors may occur!!
#   ############################################

#   number of sites
#   default :1
NS      5 

#   dimension of virtual bond
#   default :1
VD      3

#   simulation method:
#   Exact Diagonalization :0
#   Variational MPS :1
#   No Optimization :2
#   default :0
MTH  1

#   initial configuration (VMPS only)
#   random cfg :0
#   ferromagnetism :1
#   anti-ferromagnetism :2
#   default :0
INIT_CFG 0

#   length of corrlation (used for output Cxx, Cyy, Czz)
#   default :1
CL      1

#   nearest neighbor interaction strength in X direction
#   default :0.0
J1X     1.0

#   nearest neighbor interaction strength in Y direction
#   default :0.0
J1Y     0.0

#   nearest neighbor interaction strength in Z direction
#   default :0.0
J1Z     0.0

#   next nearest neighbor interaction strength in X direction
#   default :0.0
J2X     0.0

#   next nearest neighbor interaction strength in Y direction
#   default :0.0
J2Y     0.0

#   next nearest neighbor interaction strength in Z direction
#   default :0.0
J2Z     0.0

#   field strength in X direction
#   default :0.0
HX      0.0

#   field strength in Y direction
#   default :0.0
HY      0.0

#   field strength in Z direction
#   default :0.0
HZ      1.0

#   error tolerance
#   default :5e-3
TOL     5e-3

#   calculate first exicited state? (VMPS only)
#   default :0
CALC_FES     0

#   use periodic boundary condition otherwise open boundary condition will be used
#   default :0 USE_PBC      0 #   output Magnetization in (X,Y,Z) direction #   default :0 OUT_MAG      0

#   output Correlation in (X,Y,Z) direaction
#   default :0
OUT_CORR     0

#   output configurations of ground state
#   default :0
OUT_CFG      0

#   use spilt to divide system's Hamiltonian into two independent parts(i.e., has no correlation with each other)
#   defalut :0
USE_SPLIT    0 

#   sequence number(from L to R) of the split site in J1X interaction
#   defalut :0
SPLITJ1X     5

#   sequence number(from L to R) of the split site in J1Y interaction
#   defalut :0
SPLITJ1Y     0

#   sequence number(from L to R) of the split site in J1Z interaction
#   defalut :0
SPLITJ1Z     0
