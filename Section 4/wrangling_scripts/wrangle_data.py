import plotly.graph_objs as go
import requests
import pandas as pd


def return_figures():
    """Creates four plotly visualizations

    Args:
        None

    Returns:
        list (dict): list containing the four plotly visualizations

    """

    # first chart plots arable land from 1990 to 2015 in top 10 economies
    # as a line chart
    url = "https://api.covid19api.com/total/country/singapore/status/confirmed"

    payload = {}
    headers = {}

    response = requests.request("GET", url, headers=headers, data=payload)

    df = pd.DataFrame.from_dict(response.json())


    graph_one = []
    x_val = df['Date'].tolist()
    y_val = df["Cases"].tolist()
    graph_one.append(
      go.Scatter(
      x = x_val,
      y = y_val,
      mode = 'markers',
      line_shape='hv'
      )
    )

    layout_one = dict(title = 'Plot of Cases over Time',
                xaxis = dict(title = 'Date'),

                yaxis = dict(title = 'Cases'),

                )


    # append all charts to the figures list
    figures = []
    figures.append(dict(data=graph_one, layout=layout_one))


    return figures
