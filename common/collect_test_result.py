import os
import re
import sys


def strip_ansi_escape_sequences(text):
    ansi_escape_pattern = re.compile(r"\x1B(?:[@-Z\\-_]|\[[0-?]*[ -/]*[@-~])")
    return ansi_escape_pattern.sub("", text)


def collect_test_results(base_dir, log_filename="stdout_stderr.log"):
    result_data = {}

    # Walk through all subdirectories
    for root, _, files in os.walk(base_dir):
        if log_filename in files:
            file_path = os.path.join(root, log_filename)

            with open(file_path, "r") as file:
                lines = file.readlines()

                log_result = []

                # Flags to determine when to start/stop extracting
                part1_start = False
                part2_start = False

                for line in lines:
                    # Detect and start collecting Part 1
                    if re.search(r".*tests passed.*tests failed", line):
                        part1_start = True

                    # Stop collecting Part 1 when reaching "Label Time Summary:"
                    if part1_start and "Label Time Summary:" in line:
                        part1_start = False

                    # Collect lines for Part 1
                    if part1_start:
                        log_result.append(line)

                    # Detect and start collecting Part 2
                    if "Total Test time (real) =" in line:
                        part2_start = True

                    # Stop collecting Part 2 when reaching "Errors while running CTest"
                    if part2_start and "Errors while running CTest" in line:
                        part2_start = False

                    # Collect lines for Part 2
                    if part2_start:
                        log_result.append(line)

                # Save the content from this line to the end of the files
                if log_result:
                    result_data[file_path] = strip_ansi_escape_sequences(
                        "".join(log_result)
                    )

    return result_data


if len(sys.argv) < 2:
    print("Please assign the folde you want to collect logs")
    sys.exit()

base_directory = sys.argv[1] + "/log/latest_test/"
collected_results = collect_test_results(base_directory)

# Save results to a summary file or print them
summary_file = "log_" + sys.argv[1] + ".txt"
with open(summary_file, "w") as output_file:
    for file_path, content in collected_results.items():
        output_file.write(f"Results from: {file_path}\n\n")
        output_file.write(content)
        output_file.write("\n" + "=" * 80 + "\n")

print(f"Collected results saved to {summary_file}")
