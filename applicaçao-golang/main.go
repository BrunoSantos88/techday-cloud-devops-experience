package main
import (
        "fmt"
        "time"
)

func main() {
        for {
                fmt.Println("Hello Everyone!")

                time.Sleep(time.Second * 1)
        }
}