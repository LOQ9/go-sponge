package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
)

func main() {
	args := os.Args[1:]

	reader := bufio.NewReader(os.Stdin)
	var output []rune

	for {
		input, _, err := reader.ReadRune()
		if err != nil && err == io.EOF {
			break
		}
		output = append(output, input)
	}

	// When the user specifies to output as a file
	if len(args) > 0 && args[0] != "" {
		err := os.WriteFile(args[0], []byte(string(output)), 0644)

		if err != nil {
			panic(err)
		}
	} else {
		// Output to stdout
		for j := 0; j < len(output); j++ {
			fmt.Printf("%c", output[j])
		}
	}

}
