import pytest
from pathlib import Path
from lib.flow_test_framework import FlowTestFramework


def test_run_s_expr_file(flow):
    """
    Test the following file:

    lisp00.lisp:
        '''
        ()

        (car '(a b))

        (car

              '(
                   b a
               )

        )

        '''

    Expected results:
        NIL
        A
        B
    """
    # Define inputs:
    input_dir = "../lisp_files/"
    s_expr_file = f"{input_dir}/lisp00.lisp"

    # Run s_expr:
    out_file = flow.run_s_expr_file(s_expr_file)
    assert Path(out_file).read_text() == "NIL\n" \
                                         "A\n" \
                                         "B\n"


def test_load_function_file(flow):
    """
    Compile 2 functions: exists + id
    Run to s_expr files, which includes s_expr that use those functions.
    """
    # Define inputs:
    input_dir = "../lisp_files/"
    functions_file = f"{input_dir}/fun.lisp"
    s_expr_file_1 = f"{input_dir}/lisp01.lisp"
    s_expr_file_2 = f"{input_dir}/lisp02.lisp"

    # Compile functions:
    flow.load_function_file(functions_file)

    # Run s_expr:
    out_file = flow.run_s_expr_file(s_expr_file_1)
    assert Path(out_file).read_text() == "T\n" \
                                         "T\n" \
                                         "A\n"

    out_file = flow.run_s_expr_file(s_expr_file_2)
    assert Path(out_file).read_text() == "T\n" \
                                         "NIL\n" \
                                         "A\n"


@pytest.fixture
def flow():
    return FlowTestFramework("../../../Mini-Lisp.Chic/mini-lisp")
