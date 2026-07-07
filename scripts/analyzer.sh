#!/bin/bash

while true
do
    clear

    echo "======================================"
    echo "      DISK USAGE ANALYZER v1.0"
    echo "======================================"
    echo "1. Show Disk Usage"
    echo "2. Largest 10 Files"
    echo "3. Largest 10 Directories"
    echo "4. Check Free Space"
    echo "5. Generate Report"
    echo "6. Exit"
    echo

    read -p "Enter your choice: " choice

    case $choice in

    1)
        echo
        echo "Disk Usage"
        echo "-------------------------"
        df -h
        ;;

    2)
        echo
        read -p "Enter directory path: " dir

        echo
        echo "Largest 10 Files"
        find "$dir" -type f -exec ls -lh {} + 2>/dev/null | sort -k5 -hr | head -10
        ;;

    3)
        echo
        read -p "Enter directory path: " dir

        echo
        echo "Largest 10 Directories"
        du -sh "$dir"/* 2>/dev/null | sort -hr | head -10
        ;;

    4)
        echo
        echo "Free Disk Space"
        df -h /
        ;;

    5)
        report="../disk_report.txt"

        {
            echo "========== DISK REPORT =========="
            date
            echo
            echo "Disk Usage"
            df -h
            echo
            echo "Largest Directories"
            du -sh ~/* 2>/dev/null | sort -hr | head -10
        } > "$report"

        echo
        echo "Report generated successfully."
        echo "Saved as: disk_report.txt"
        ;;

    6)
        echo "Goodbye!"
        exit
        ;;

    *)
        echo "Invalid Choice!"
        ;;
    esac

    echo
    read -p "Press Enter to continue..."
done
