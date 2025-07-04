import pandas as pd
import matplotlib.pyplot as plt
import os

def plot_data_trends(file_paths, data_column, title, ylabel):
    plt.figure(figsize=(12, 7)) # The size of the figure

    for i, file_path in enumerate(file_paths):
        try:
            df = pd.read_csv(file_path)

            if 'time_ms' not in df.columns or data_column not in df.columns:
                print(f"Error: {file_path} lacks 'time_ms' of '{data_column}' field. Skip.")
                continue

            # Plot and use os.path.basename as the legend
            plt.plot(df['time_ms'], df[data_column], label=f'{os.path.basename(file_path)} {data_column}')

        except FileNotFoundError:
            print(f"Error: {file_path} doesn't exist.")
        except Exception as e:
            print(f"Error when reading {file_path}: {e}")

    # Set the title and label
    plt.title(title, fontsize=16)
    plt.xlabel('Time (ms)', fontsize=12)
    plt.ylabel(ylabel, fontsize=12)

    # Show the legend
    plt.legend(fontsize=10)

    # Show the grid
    plt.grid(True, linestyle='--', alpha=0.7)

    # Adjust the layout to avoid the overlapping of the labels
    plt.tight_layout()

    # Show the plot
    plt.show()

if __name__ == "__main__":
    your_file_paths = ['cyclonedds', 'fastdds', 'zenoh', 'original_zenoh']

    print("Plotting CPU usage run chart...")
    plot_data_trends(your_file_paths, 'cpu_perc', 'CPU Usage', 'CPU Usage (%)')

    print("Plotting RSS Memory run chart...")
    plot_data_trends(your_file_paths, 'rss_KB', 'RSS Memory', 'RSS Memory (KB)')
