import matplotlib.pyplot as plt

stages = ['Visited', 'Signed Up', 'Trail', 'Purchased']
counts = [5, 4, 3, 2]

plt.figure(figsize=(8, 5))
plt.plot(stages, counts, marker='o', linewidth=3)
plt.title('User Funnel Chart')
plt.xlabel('Funnel Stage')
plt.ylabel('User Count')
plt.grid(True)
plt.savefig("funnel_chart.png")
plt.show()
