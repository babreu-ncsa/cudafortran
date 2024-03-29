program peakBandwidth
        use cudafor
        implicit none
        
        integer :: i, istat, nDevices
        type(cudaDeviceProp) :: prop
        
        istat = cudaGetDeviceCount(nDevices)
        do i = 0, nDevices - 1
                istat = cudaGetDeviceProperties(prop, i)
                write(*, "(' Device Number: ',i0)") i
                write(*, "(' Device Name: ',a)") trim(prop%name)
                write(*, "(' Mem Clock Rate (KHz): ',i0)") &
                                        prop%memoryClockRate
                write(*, "(' Mem Bus Width (bits): ',i0)") &
                                        prop%memoryBusWidth
                write(*, "(' Peak Memory Bandwidth (GB/s): ',f6.2)") &
                        2.0*prop%memoryClockRate*(prop%memoryBusWidth/8) &
                        /10.0**6
                write(*,*)
        enddo
end program peakBandwidth
