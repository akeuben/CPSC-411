import re
import json
import os

# -----------------------------
# Mapping from description → filename
# -----------------------------
NAME_MAP = {
    '4': '4.json',
    'all your base are belong to us': 'all_your_base_are_belong_to_us.json',
    'a not-ty program': 'a_not-ty_program.json',
    'assignment: Boolean': 'assignment_Boolean.json',
    'assignment conga line': 'assignment_conga_line.json',
    'basic maze generation from Entombed (1982)': 'basic_maze_generation_from_Entombed_1982.json',
    'Boolean bonanza': 'Boolean_bonanza.json',
    'break the compiler': 'break_the_compiler.json',
    'de fault line': 'de_fault_line.json',
    'division by zero': 'division_by_zero.json',
    'dynamic semantic check': 'dynamic_semantic_check.json',
    'echo one = boring test, great call sign': 'echo_one_boring_test_great_call_sign.json',
    'hang on just a minint': 'hang_on_just_a_minint.json',
    'hello, world': 'hello_world.json',
    'hello, world with extra steps': 'hello_world_with_extra_steps.json',
    'hunting minint': 'hunting_minint.json',
    'iterative Fibonacci': 'iterative_Fibonacci.json',
    'less obvious division by zero': 'less_obvious_division_by_zero.json',
    'many happy returns': 'many_happy_returns.json',
    'more minint edge cases': 'more_minint_edge_cases.json',
    'nested loops et al.': 'nested_loops_et_al.json',
    'order up!': 'order_up.json',
    'prime number sieve': 'prime_number_sieve.json',
    'recursive-descent calculator': 'recursive-descent_calculator.json',
    'recursive Fibonacci': 'recursive_Fibonacci.json',
    'recursive I/O': 'recursive_IO.json',
    'register blow-out': 'register_blow-out.json',
    'RTS checking': 'RTS_checking.json',
    'scope check': 'scope_check.json',
    'selection sort': 'selection_sort.json',
    'short-circuiting your compiler': 'short-circuiting_your_compiler.json',
    'stringing you along': 'stringing_you_along.json',
    'the Game of Life': 'the_Game_of_Life.json',
    'the null program': 'the_null_program.json',
    'too many arguments': 'too_many_arguments.json',
    'while-loop assignment': 'while-loop_assignment.json',
}

OUTPUT_DIR = "out_json"
os.makedirs(OUTPUT_DIR, exist_ok=True)


# -----------------------------
# Parse function
# -----------------------------
def parse_tests(text):
    # Split into test blocks
    blocks = re.split(r'-{10,}\nTest:\s*', text)[1:]

    results = []

    for block in blocks:
        # Extract test name
        name_match = re.match(r'(.+?)\s*\|', block)
        if not name_match:
            continue
        test_name = name_match.group(1).strip()

        # Extract stdout (SPIM section)
        stdout_match = re.search(r'STDOUT:\n(.*?)\n\nSTDERR:', block, re.DOTALL)
        stdout = stdout_match.group(1).strip() if stdout_match else ""

        # Extract stderr (final one)
        stderr_matches = re.findall(r'STDERR:\n(.*?)\n\nRETURN CODE:', block, re.DOTALL)
        stderr = stderr_matches[-1].strip() if stderr_matches else ""

        # Extract return code (final one)
        return_codes = re.findall(r'RETURN CODE:\s*(\d+)', block)
        exit_code = int(return_codes[-1]) if return_codes else 0

        results.append((test_name, stdout, stderr, exit_code))

    return results


# -----------------------------
# Main
# -----------------------------
def main(input_file):
    with open(input_file, 'r') as f:
        text = f.read()

    tests = parse_tests(text)

    for name, stdout, stderr, code in tests:
        if name not in NAME_MAP:
            print(f"Skipping unknown test: {name}")
            continue

        filename = NAME_MAP[name]

        data = {
            "stdout": stdout,
            "stderr": stderr,
            "path": "",   # fill if you want real paths
            "exit_code": code
        }

        out_path = os.path.join(OUTPUT_DIR, filename)
        with open(out_path, 'w') as f:
            json.dump(data, f, indent=2)

        print(f"Wrote {out_path}")


if __name__ == "__main__":
    main("run.output")  # replace with your file
