grep -h 'Rebase from ' /tslogs/log*.log | tee >(grep -h 'Promotion of ' /tslogs/log*.log) | sort
