program tsunami
    implicit none
    !integer :: i # 4 bytes til vanlig. (Signed)
    !real :: r # 
    !complex :: c = (1.1, 0.8) # vet ikke.
    integer :: i, n
    integer :: grid_size
    integer :: num_time_steps

    real :: dt ! time step [s]
    real :: dx ! grip spacing [m]
    real :: c ! phase speed [m/s]

    grid_size = 100
    num_time_steps = 100

    dt = 1.
    dx = 1.
    c = 1.



end program tsunami

!gfortran -c hello.f90
!gfortran hello.o -o tsunami