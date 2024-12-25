program tsunami
    implicit none
    !integer :: i # 4 bytes til vanlig. (Signed)
    !real :: r # 
    !complex :: c = (1.1, 0.8) # vet ikke.
    integer :: i, n
    !integer :: grid_size
    !integer :: num_time_steps

    integer, parameter :: grid_size = 100
    integer, parameter :: num_time_steps = 100

    real, parameter :: dt = 1 ! time step [s]
    real, parameter :: dx = 1 ! grip spacing [m]
    real, parameter :: c = 1! phase speed [m/s]

    real :: h(grid_size), dh(grid_size)

    integer, parameter :: icenter = 25
    real, parameter :: decay = 0.02

    if(grid_size <= 0) stop 'grid_size must be > 0'
    if(dt <= 0) stop 'time step dt must be > 0'
    if(dx <= 0) stop 'grid spacing dx must be > 0'
    if(c <= 0) stop 'background flow speed c must be > 0'

    do concurrent(i = 0:grid_size)
        h(i) = exp(-decay * (i - icenter)**2)
    end do

    print *, 0, h

    time_loop: do n = 1, num_time_steps
    dh(1) = h(1) - h(grid_size)

    do concurrent(i = 2:grid_size)
        dh(i) = h(i) - h(i-1)
    end do

    print *, n, h

end do time_loop

end program tsunami

!gfortran -c hello.f90 -o bin/hello.o
!gfortran bin/hello.o -o bin/tsunami

!outer_loop: do j = 1, jm
!    inner_loop: do i = 1, im
! end do inner_loop
!end do outer_loop