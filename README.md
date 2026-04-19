# Sauce Labs Robot Framework Test with Tunnel

This is a sample Robot Framework test that demonstrates running a test on Sauce Labs using a secure tunnel.

## Prerequisites

- Python 3.x
- Robot Framework
- SeleniumLibrary
- Sauce Labs account with username and access key
- Sauce Connect (for tunnel, if testing local applications)

## Setup

1. Install dependencies:
   ```
   pip install robotframework robotframework-seleniumlibrary webdriver-manager
   ```

2. For local testing with tunnel (if needed):
   - Download Sauce Connect from https://saucelabs.com/downloads/sc
   - Start the tunnel with a name, e.g.:
     ```
     ./sc -u your_username -k your_access_key -i your_tunnel_name
     ```

3. Set environment variables:
   - `SAUCE_USERNAME`: Your Sauce Labs username (for remote)
   - `SAUCE_ACCESS_KEY`: Your Sauce Labs access key (for remote)
   - `TUNNEL_NAME`: The tunnel name (optional, defaults to 'my_tunnel')
   - `RUN_ON_SAUCE`: Set to 'True' for remote, 'False' for local (defaults to 'True')

## Running the Test Locally

To run locally:
```
export RUN_ON_SAUCE=False
robot login_sauce.robot
```

## Running the Test on Sauce Labs

To run on Sauce Labs:
```
export SAUCE_USERNAME=your_username
export SAUCE_ACCESS_KEY=your_access_key
export RUN_ON_SAUCE=True
robot login_sauce.robot
```

## CI/CD Pipeline

The project includes a GitHub Actions workflow that runs the tests on both Windows and Linux.

### Setup for Pipeline

1. In your GitHub repository, go to Settings > Secrets and variables > Actions
2. Add the following secrets:
   - `SAUCE_USERNAME`: Your Sauce Labs username
   - `SAUCE_ACCESS_KEY`: Your Sauce Labs access key
   - `TUNNEL_NAME`: (Optional) The tunnel name if using Sauce Connect

The workflow will trigger on pushes and pull requests to the main branch, running the Robot tests on Sauce Labs.
